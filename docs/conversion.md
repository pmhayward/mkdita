# A process for converting DITA topics to Markdown


## Requirements

- Convert current DITA topics to equivalent Markdown files that are easy to edit, i.e. do not include chunks of HTML and non-standard Markdown. (Exceptions: Git-Flavored Markdown (GFM) tables and the MkDocs extension for definition lists.)
- In some instances, concatenate current topics to form longer Markdown topics, without destroying the structure of the original DITA maps.
- Assume that the process must be repeatable. It's therefore essential to minimise any manual 'tweaks'.

## Steps

**Note:** These steps assume the use of MkDocs. If we decide to use a different environment, the process would probably stay much the same with only minor changes, mostly with the way that a config file (`mkdocs.yml` in this case) is handled.

1. Transform DITA to XHTML as usual. The aim here is to avoid making changes to the DITA source that are specifically for this process and that will disrupt the current transforms. Doing this transform first, also takes care of:

    - Arbitrary line breaks, which make parsing complicated, especially if they're in the middle of tags.
    - Ditaval exclusions.
    - Conrefs - **Note:** if text (as opposed to entities for product names etc.) is reused, we might want to add comments that persist into the HTML, so that future updates are made in all the relevant places.
    - Standard text in task topics - "Before you begin" etc.
    - `<menucascade>` elements, which need `>` characters to be added.
    - Trademarks - marking first occurences (only) with appropriate symbol. (But how does this work in an open-source world?)
    - Draft comments - we probably don't want these in an open environment!
    - anything else?...

2. Take XHTML files (e.g. from regular `.jar` file) and use Pandoc to convert each one to GFM:

    - GFM is understood by MkDocs. The main enhancement is for tables. Pandoc will convert HTML tables into GFM Markdown tables that are easy to edit.

        **Note:** these tables do **not** allow for multiple lines per cell, nor for spanned rows/columns; this might require some manual adjustment to tables in the DITA source. (Of course, that partly breaks the aim in 1. above!)

    - File name stays the same; `.html` extension changes to `.md`.
    - Topic title becomes H1 (#) in the converted file.

3. Use a custom application to parse the Markdown files that are output from Pandoc, adjust them for our purposes, and output 'pure' Markdown:

    - Use an 'embellished' MkDocs YAML (`.yml`) file (as specified in the [parameter](#conversion_config_file) `ymlSrcFileName`; default `mkdocs_src.yml`) to determine new topics that are to be created. This means that all the rearranging of topics can be done at this stage without disturbing the original maps.

        **Note:** this YAML file could be created automagically from the TOC produced by the DITA transform (so as to get correct navtitles) as a one-off operation. This automatic process would create a direct 1:1 mapping of DITA topics to Markdown topics (see first [concatenation scenario](#concatenation_scenarios) below), which could later be modified by hand to produce a new arrangement of topics.

    - Concatenate files as necessary and adjust levels of headers accordingly (need to change underlines for H1 and H2 to `#` and `##`). See [Concatenating topics](#concatenating_topics) below.
    - Change remaining HTML to Markdown according to table in [Pandoc transforms](transforms`.md`).
    - Remove parent/child links. (Previous and next links are added automatically by the 'material' MkDocs theme.)

    **Note:** It's probably easiest/best to perform the steps in the order indicated here, but steps 2 and 3 could be reversed so as to first convert the XHTML that is output from the DITA transform to a form that we know Pandoc would then convert to 'clean' Markdown.

4. Copy the source MkDocs YAML config file to the output, removing all the extra content about source files that's in the `pages:` section. (The output file name is specified in the [parameter](#conversion_config_file) `ymlFileName`; default `mkdocs.yml`.)

    (This step could be avoided if all the extra info were placed after a comment symbol (`#`) but we might not want all that stuff to be public anyway.)

5. Copy any other required files to the appropriate output directory (images, ...)


## Concatenating topics

MkDocs requires a single YAML (`.yml`) file for its configuration. This file has a `pages:` section to define the TOC, which consists of a normal Markdown unordered list. Each item in the list comprises the topic title followed by a colon (:) and the Markdown file name, including the `.md` file extension.

**Note:** if there is a sub-list of "child" topics, the "parent" title is still followed by a colon, but it does **not** have an associated topic.) For example:

    - Topic one : topic_1.md
    - A group of topics :
        - Topic two : topic_2.md
        - Topic three : topic_3.md


For our purposes, we need to create a YAML config file with some extra bits that define how the original topics are to be arranged into the new TOC.

**Note:** Throughout the conversion process from DITA to HTML to Markdown, the file name stays the same; only the extension changes. The file names specified here, though referencing the Pandoc Markdown output, therefore equate to the original DITA files as well.

Syntax of 'extra bits':

- Follow each Markdown file name with square brackets containing one or more source file names.
- If there's more than one file, add a list of names separated with pipe symbols (|). These files will be concatenated into one Markdown topic in the order listed.
- The new Markdown navtitle doesn't have to be the same as the original or of any of the DITA topic titles.
- The new Markdown file name can be different from any of the DITA files listed. (Suggest we take the opportunity to rationalise them a bit, by making file names relate to each other so that in a directory listing, they remain grouped together!)
- The source file names do not need to have a file extension. If you do not include one, the value of the config parameter `sourceTopicExt` is assumed (default = `.md`).
- Titles:
    - The title of the first (or only) topic is used as the title for the whole Markdown topic. (See scenario 1 below.)
    - The titles of the subsequent DITA topics in the list are used for the sections in the resulting Markdown topic. (See scenario 2 below.)
    - If you want to use a different title for a section, include it in double quotation marks ("...") before the topic file name. If this is the first topic in the list, the replacement title is used for the whole topic. (See scenario 3 below.)
    - If you want a completely new title for the resulting Markdown topic *and* keep the title of the first source topic, include that whole-topic title as the first item in the list, but do not add a source file name after it. (See scenario 4 below.)
- If you enclose a listed file name in parentheses, the source from that file will be included exactly 'as-is' with no further parsing. This allows extra text to be included that is not part of the original DITA content. **Note:** if extra content is added as the first item, it's assumed that it will contain an appropriate title and correct levels of subheadings, unless the title is supplied in the YAML file as above. (See scenario 5 below.)

### Concatenation scenarios

1. **Straight 1:1 mapping**

    This line in the YAML file:

    `- <New topic navtitle> : <new_md_file_name>.md [source_1]`

    produces a Markdown topic with this structure:

        # <Topic title>                  // Topic title taken from original DITA topic.
            <topic contents>

2. **Several DITA topics concatenated into one**

    The first topic might well have once been the parent of the others, but now acts as an intro. This line in the YAML file:

    `- <New topic navtitle> : <new_md_file_name>.md [<source_1>|<source_2>|<source_3>]`

    produces a Markdown topic with this structure:

        # <source_1 title>               // Title of concatenated topic is taken from <source_1>.
            <source_1 contents>          // Levels of subtitles in this part start at ###, not
                                         // ##, so they're at same level as subtitles of
                                         // subsequent 'topics'; happy to break the rules here!

            ## <source_2 title>
                <source_2 contents>      // Levels of subtitles adjusted accordingly.

            ## <source_3 title>
                <source_3 contents>      // Levels of subtitles adjusted accordingly.

3. **Several DITA topics concatenated into one with some new titles**

    This line in the YAML file:

        - <New topic navtitle> : <new_md_file_name>.md ["<New title for source_1>" <source_1>|
                                                        "<New title for source_2>" <source_2>|
                                                         <source_3>]
                                         // N.B. list can span several lines, but still
                                         // requires pipe (|) separator.

    produces a Markdown topic with this structure:

        # <New title for source_1>       // Title specified in the YAML file replaces the
                                         // title of <source_1> and is used for concatenated
                                         // topic.
            <source_1 contents>

            ## <New title for source_2>  // Title specified in the YAML file replaces the
                                         // title of <source_2>.
                <source_2 contents>

            ## <source_3 title>          // Keeps original title
                <source_3 contents>

4. **Several DITA topics concatenated into one with a new title for the whole topic**

    This line in the YAML file:

        - <New topic navtitle> : <new_md_file_name>.md ["<New topic title>"|
                                                        "<New title for source_1>" <source_1>|
                                                        <source_2>]`

    produces a Markdown topic with this structure:

        # <New topic title>              // Title specified in the YAML file.

            ## <New title for source_1>  // Title specified in the YAML file replaces
                                         // the title of <source_1>.
                <source_1 contents>

            ## <source_2 title>          // Keeps original title
                <source_2 contents>

5. **Several DITA topics concatenated into one with some extra text**

    This line in the YAML file:

    `- <New topic navtitle> : <new_md_file_name>.md [<source_1>|(<extra>)|<source_2>]`

    produces a Markdown topic with this structure:

        # <source_1 title>
            <source_1 contents>

            ## <extra source title>      // If included in source file.
                <extra content>          // Content added 'as-is', including subtitles.

            ## <source_2 title>
                <source_2 contents>



## Messages

No plan for messages! Currently we'd either concatenate them back in the DITA source (and then treat them as regular topics), or just not include them in the Markdown.

In the future, there might be a way of extracting messages from the code source with DimWit, as endorsed by MQ and IIB ;) Some effort would possibly be needed if a new input plugin was required, but concatenated HTML output suitable for KC is already available and producing an alternative Markdown output would be relatively trivial.



## Conversion config file

The config file used by the application that parses Markdown files output from Pandoc must define the following parameters:

| Parameter              | Default                         | Notes                                                                       |
|------------------------|---------------------------------|-----------------------------------------------------------------------------|
|`inputDir              `|` ./src                         `| source of topics as output from Pandoc                                      |
|`extraDir              `|` ./extra                       `| source of extra information not in orginal DITA topics                      |
|`outputDir             `|` ./out                         `| input directory structure is recreated under this directory                 |
|`inputEncoding         `|` CP1252                        `| = Latin 1 (OK for English)                                                  |
|`outputEncoding        `|` CP1252                        `| = Latin 1 (OK for English)                                                  |
|`log                   `|` 3                             `| `0`= none, `1`= log to file, `2`= log to screen, `3`= log to file & screen  |
|`debug                 `|` true                          `| debug info output according to log setting (`true`/`false`, `1`/`0`)        |
|`debugTopic            `|`                               `| file names that start with this string are debugged in detail               |
|`logFileName           `|` parse.log                     `| ignored if `log` = `0` or `2`                                               |
|`sourceTopicExt        `|` md                            `| source will typically be Markdown, as produced by Pandoc                    |
|`elementsFileName      `|` elements.txt                  `| list of HTML elements and Markdown equivalents                              |
|`ymlSrcFileName        `|` mkdocs_src.yml                `| Source MkDocs YAML file name                                                |
|`ymlFileName           `|` mkdocs.yml                    `| Output MkDocs YAML file name                                                |
|`                      `|`                               `|                                                                             |
|`                      `|`                               `|                                                                             |
|`                      `|`                               `|                                                                             |
