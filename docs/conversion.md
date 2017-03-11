# Process for converting DITA topics to Markdown


## Requirements

- Convert current DITA topics to equivalent Markdown files that are easy to edit, i.e. do not include chunks of HTML and non-standard Markdown.  Exceptions:
    - Git-Flavored Markdown (GFM) tables
    - PHP Markdown extension for definition lists
- In some instances, concatenate current topics to form longer Markdown topics, without destroying the structure of the original DITA maps.
- Assume that the process must be repeatable. It's therefore essential to minimise any manual 'tweaks'.

## Steps

<!--
**Note:** These steps assume the use of MkDocs. If we decide to use a different environment, the process would probably stay much the same with only minor changes, mostly with the way that a config file (`mkdocs.yml` in this case) is handled.
-->

1. **Transform DITA to XHTML as usual.** The aim is to avoid making changes to the DITA source that are specifically for this process and that will disrupt the current transforms. Doing this transform first, also takes care of:

    - Arbitrary line breaks, which make parsing complicated, especially if they're in the middle of tags.
    - Ditaval exclusions.
    - Conrefs - **Note:** if text (as opposed to entities for product names etc.) is reused, we might want to add comments that persist into the HTML, so that future updates are made in all the relevant places.
    - Standard text in task topics - "Before you begin" etc.
    - `<menucascade>` elements, which need` >` characters to be added.
    - Trademarks - marking first occurences (only) with appropriate symbol. (But how does this work in an open-source world?!)
    - Draft comments - we probably don't want these in an open environment!

2. **Take XHTML files and use Pandoc to convert each one to PHP Markdown** (source could be from regular `.jar` file) :

    - This version of Markdown is understood by MkDocs. The main enhancement is for tables. Pandoc will convert HTML tables into GFM Markdown tables that are easy to edit.
        **Note:** these tables do **not** allow for multiple lines per cell, nor for spanned rows/columns; this might require some manual adjustment to tables in the DITA source. (Of course, that partly breaks the aim in 1. above!)
    - Pandoc transforms definition lists (of which we have many) to an equivalent form in PHP Markdown that uses a colon (:) to indicate the definition. If this non-standard tagiing is not acceptable, definition lists can later be transformed to unordered lists, but it's important not to lose the information at this stage. 
    - File names stay the same; `.html` extension changes to `.md`.
    - Topic title becomes H1 (#) in the converted file.


3. **Parse the Markdown files that are output from Pandoc**, and adjust them for our purposes.

    <img align="right" src="../images/tuktuk_250.jpg" style="padding-left:10px; padding-bottom:10px;">
     The Java application (called "TukTuk" transforms and cleans the Pandoc output. (The electrically-powered TukTuk is a fine means of transport!)

    This application uses an 'embellished' MkDocs YAML (`.yml`) file (as specified in the [parameter](#conversion-config-file) `ymlSrcFileName`) to determine new topics that are to be created. This means that all the rearranging of topics can be done at this stage without disturbing the original maps, if required.
    
    **Note:** this YAML file could be created automagically from the TOC produced by the DITA transform (so as to get correct navtitles) as a one-off operation. This automatic process would create a direct 1:1 mapping of DITA topics to Markdown topics (see first [concatenation scenario](#concatenation_scenarios) below), which could later be modified by hand to produce a new arrangement of topics.
    
    The folowing functions are performed:
    
    - Concatenate files according to config file; see [Concatenating topics](#concatenating-topics) below
    - Change underlines for level 1 and 2 headers to `#` and `##` respectively
    - Add/replace headers as specified in config file and adjust levels in concatenated topics
    - Replace remaining HTML elements (including links and images) with equivalent Markdown, according to table in [Pandoc transforms](transforms.md)
    - Delete any metadata inserted by Pandoc in `{ ... }`
    - Ignore other "odd" strings!
    - Fix external link icons
    - Change `™` & `®` characters to `&trade;` and `&reg;` entities
    - Adjust lists (ordered and unordered) to work better
    - Convert definition lists to unordered lists (optional - set by the [parameter](#conversion-config-file) `convertDL`)
    - Remove images for revs
    - Remove parent/child links. (Previous and next links are added automatically by the 'material' MkDocs theme.)
    - Adjust link targets to account for changes of title, file name, location, and possibility that topic is now a subsection within another topic. 
    - Convert links and images to Markdown if not done by Pandoc
    - Adjust `code` and `fig` blocks to work better:
        - 4-space indentation seems to be the safest mechanism, especially where the code block is within a list item, for example.
        - Code can be highlighted by using the `- codehilite` extension, declared in the MKDocs config `.yml` file.
        - Line numbers can be added to code blocks by adding `(linenums=true)` to the `- codehilite` extension declaration.
        - The language for code highlighting can be specified on each code block by making the first line `:::<language>` (this only works for indented code blocks). By default, TukTuk doesn't add a language. You can specify `<language>` in the [parameter](#conversion-config-file) `codeLangHighlight`.
    - Change `&lt;` and `&gt;` entities if in code, to `<` and `>` characters

4. **Copy the source MkDocs YAML config file to the output**, removing all the extra content about source files that's in the `pages:` section. (The output file name is specified in the [parameter](#conversion-config-file) `ymlFileName`.)

5. **Copy any other required files to the appropriate output directory** (images, ...)


## Concatenating topics

MkDocs requires a single YAML (`.yml`) file for its configuration. This file has a `pages:` section to define the TOC, which consists of a normal Markdown unordered list. Each item in the list comprises a hyphen (-), the topic title, a colon (:), and the Markdown file name, including the `.md` file extension.

**Note:** if there is a sub-list of "child" topics, the "parent" title is still followed by a colon, but it does **not** have an associated topic.) For example:

    - Topic one : topic_1.md
    - A group of topics :
        - Topic two : topic_2.md
        - Topic three : topic_3.md


For our purposes, we need to create a YAML config file with some extra bits that define how the original topics are to be arranged into the new TOC.

**Note:** Throughout the conversion process from DITA to HTML to Markdown, the file name stays the same; only the extension changes. The file names specified here, though referencing the Pandoc Markdown output, therefore equate to the original DITA files as well.

Syntax of 'extra bits':

- Follow each Markdown file name with braces (aka curly brackets!) containing one or more source file names.
- If there's more than one file, add a list of names separated with pipe symbols (|) or line breaks. These files are concatenated into one Markdown topic in the order listed.
- The new Markdown navtitle doesn't have to be the same as the original or of any of the DITA topic titles.
- The new Markdown file name can be different from any of the DITA files listed. (Suggest we take the opportunity to rationalise them a bit, by making file names relate to each other so that in a directory listing, they remain grouped together!)
- The source file names do not need to have a file extension. If you do not include one, the value of the config parameter `sourceTopicExt` is assumed (default = `.md`).
- Titles:
    - The title of the first (or only) topic is used as the title for the whole Markdown topic. (See scenario 1 below.)
    - The titles of the subsequent DITA topics in the list are used for the sections in the resulting Markdown topic. (See scenario 2 below.)
    - If you want to use a different title for a section, include it in double quotation marks ("...") before the topic file name. If this is the first topic in the list, the replacement title is used for the whole topic. (See scenario 3 below.)
    - If you want a completely new title for the resulting Markdown topic *and* keep the title of the first source topic, include that whole-topic title as the *first* item in the list, but do not add a source file name after it. (See scenario 4 below.)
- If you enclose a listed file name in parentheses, the source from that file is included exactly 'as-is' with **no further parsing**. (Levels of headings are not adjusted, and if you specify a replacement title for this item, it is ignored.) This allows extra text to be included that is not part of the original DITA content. **Note:** if extra content is added as the first item, it's assumed that it contains an appropriate title and levels of subheadings. (See scenario 5 below.)

### Concatenation scenarios

1. **Straight 1:1 mapping**

    This line in the YAML file:

        - <New navtitle> : <new_md_file_name>.md {source_1}

    produces a Markdown topic with this structure:

        # <Topic title>                  // Topic title taken from original DITA topic.
            <topic contents>

2. **Several DITA topics concatenated into one**

    The first topic might well have once been the parent of the others, but now acts as an intro. This line in the YAML file:

        - <New navtitle> : <new_md_file_name>.md {<source_1>|<source_2>|<source_3>}

    produces a Markdown topic with this structure:

        int a = 1234;
        # <source_1 title>              // Title of concatenated topic taken from <source_1>
            <source_1 contents>         // Levels of subtitles in this part start at ###,
                                        // not ##, so they're at same level as subtitles of
                                        // subsequent 'topics'.

            ## <source_2 title>
                <source_2 contents>     // Levels of subtitles adjusted accordingly.

            ## <source_3 title>
                <source_3 contents>     // Levels of subtitles adjusted accordingly.

3. **Several DITA topics concatenated into one with some new titles**

    This line in the YAML file:

        - <New navtitle> : <new_md_file_name>.md {"<New title for source_1>" <source_1>
                                                  "<New title for source_2>" <source_2>
                                                  <source_3>}

    produces a Markdown topic with this structure:

        # <New title for source_1>      // Title specified in the YAML file replaces the
                                        // the title of <source_1> and is used for
                                        // concatenated topic.
            <source_1 contents>
            ## <New title for source_2> // Title specified in the YAML file replaces the
                                        // title of <source_2>.
                <source_2 contents>

            ## <source_3 title>         // Keeps original title
                <source_3 contents>

4. **Several DITA topics concatenated into one with a new title for the whole topic**

    This line in the YAML file:

        - <New navtitle> : <new_md_file_name>.md {"<New topic title>"
                                                  "<New title for source_1>" <source_1>
                                                  <source_2>}`

    produces a Markdown topic with this structure:

        # <New topic title>             // Title specified in the YAML file.

            ## <New title for source_1> // Title specified in the YAML file replaces
                                        // the title of <source_1>.
                <source_1 contents>

            ## <source_2 title>         // Keeps original title
                <source_2 contents>

5. **Several DITA topics concatenated into one with some extra text**

    This line in the YAML file:

`    - <New topic navtitle> : <new_md_file_name>.md {<source_1>|(<extra>)|<source_2>}`

    produces a Markdown topic with this structure:

        # <source_1 title>
            <source_1 contents>

            ## <extra source title>     // If included in source file.
                <extra content>         // Content added 'as-is', including subtitles.

            ## <source_2 title>
                <source_2 contents>



## Messages

No plans for messages! Currently we'd either concatenate them back in the DITA source (and then treat them as regular topics), or just not include them in the Markdown.

In the future, there might be a way of extracting messages from the code source with DimWit, as endorsed by MQ and IIB ;) Some effort would possibly be needed if a new input plugin was required, but concatenated HTML output suitable for KC is already available and producing an alternative Markdown output would be relatively trivial.



## Conversion config file

The ini file used by the application that parses Markdown files output from Pandoc defines the following parameters:

| Parameter              | Default                         | Notes                                                                       |
|------------------------|---------------------------------|-----------------------------------------------------------------------------|
|`inputDir`              |`./`                             | Source of topics as output from Pandoc                                      |
|`extraDir`              |`./extra`                        | Source of extra information not in orginal DITA topics                      |
|`outputDir`             |`./out`                          | Input directory structure is recreated under this directory                 |
|`docsDir`               |`./docs`                         | For MkDocs: doc output created under` ./out/docs`                           |
|`tempDir`               |`./temp`                         | Intermediate output is written here                                         |
|`retainTemp`            |`false`                          | By default,` tempDir` is deleted after processing is complete               |
|`inputEncoding`         |`UTF-8`                          |                                                                             |
|`outputEncoding`        |`UTF-8`                          |                                                                             |
|`log`                   |`2`                              |` 0`= none,` 1`= log to file,` 2`= log to screen,` 3`= log to file & screen  |
|`logFileName`           |`parse.log`                      | Ignored if` log` =` 0` or` 2`                                               |
|`debug`                 |`true`                           | Debug info output according to log setting (`true`/`false`,` 1`/`0`)        |
|`debugTopic`            |                                 | This file (no file extension) is debugged in detail                         |
|`sourceTopicExt`        |`md`                             | Source will typically be Markdown, as produced by Pandoc                    |
|`elementsFileName`      |`elements.txt`                   | List of HTML elements and Markdown equivalents                              |
|`configSrcFileName`     |` mkdocs_src.yml`&nbsp;&nbsp;&nbsp;| Source MkDocs YAML file name                                              |
|`configFileName`        |`mkdocs.yml`                     | Output MkDocs YAML file name                                                |
|`defaultLinkTopic`      |`index.md`                       | internal links with no target topic are redirected here by default          |
|`deleteMeta`            |`true`                           | Delete metadata in` {...}` after headers                                    |
|`convertDL`             |`false`                          | Converts definition lists (which use ":") to unordered lists                |
|`externalLinkIconDir`&nbsp;&nbsp;&nbsp; |`img`            | Directory for external link icon                                            |
|`showFileNameEquiv`     |`false`                          | List old vs new file names in log output                                    |
|`codeLangHighlight`     |`java`                           | Set language for highlighting code blocks                                   |
|`convertMode`           |`1`                              | Conversion mode: 1=map; 2=topics; 3=map+topics                              |
|`sourceDitamap`         |`home_new`                       | Map to be converted: `.ditamap` or `.xml`; if not specified, `.xml` assumed |
|`configTemplate`        |`mkdocs_template`                | Template for config file; `pages:` section added at end                     |

