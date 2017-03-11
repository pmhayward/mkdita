# Pandoc transforms

#### Git-Flavored Markdown (GFM)

The following table shows result of transforming **DITA** to **XHTML** and then to **Git-Flavored Markdown** by using Pandoc

- [html] implies that the HTML is carried over to the Markdown.
- [no tagging] means that HTML tags are removed in the Markdown.
- Tables are transformed from HTML by using pipes (|) and dashes (-).

**Highlighting required** indicates usual IBM rendering of DITA elements.

**MD required** is best attempt at implementing required highlighting

<!-- 
#### CommonMark Markdown (CMD) differences

- `#` and `##` used instead of `===` and `---` respectively.
- `\<` and `\>` rather than `&gt;` and `&lt;`
- All tagging is removed that it doesn't understand (i.e. [no tagging] instead of [html] in following list) except...
- Tables are simply transfered as HTML. 
-->

#### Table of DITA element transforms to Markdown

| DITA element  | Transform to XHTML                                               | To G-F Markdown     | Highlighting required | MD required |
|---------------|------------------------------------------------------------------|---------------------|---------------|---------------------| 
| topic title   | `<h1 class="title topictitle1">                                ` | `===` underline     | H1            | #                   |
| abstract      | `<div class="abstract">                                        ` | `---` underline     | H2            | ##                  |
| shortdesc     | `<span class="shortdesc">                                      ` | [html]              |               |                     |
| apiname       | `<span class="keyword apiname">                                ` | [html]              | mono          | &grave;             |
| bold          | `<strong class="ph b">                                         ` | `**`                | bold          | `**` or `__`        |
| cite          | `<cite class="cite">                                           ` | [html]              | italic        | `*` or `_`          |
| cmdname       | `<span class="keyword cmdname">                                ` | [html]              | bold          | `**` or `__`        |
| codeblock     | `<pre class="pre codeblock"><code>                             ` | &grave; pre         | pre mono      | &grave;             |
| codeph        | `<samp class="ph codeph">                                      ` | [html]              | mono          | &grave;             |
| dl            | `<dl class="dl">                                               ` | [no tagging]        |               |                     |
|               | `<dt class="dthd"><strong>                                     ` | `**`                | bold          | `**` or `__`        |
|               | `<dd class="ddhd"><strong>                                     ` | `**`                | bold indented | : [def_list extension] |
|               | `<dt class="dt dlterm">                                        ` | [no tagging]        |               |                     |
|               | `<dd class="dd">                                               ` | [no tagging]        | indented      | : [def_list extension] |
| filepath      | `<span class="ph filepath">                                    ` | [html]              | mono          | &grave;             |
| image         | `<img class="image" src="hand.gif" alt="alt_text" />           ` | [html]              |               |                     |
| i             | `<em class="ph i">                                             ` | `*`                 | italic        | `*` or `_`          |
| keyword       | `<span class="keyword">                                        ` | [html]              |               |                     |
| lines         | `<p class="lines"> ... <br />                                  ` | [no tagging]        |               |                     |
| lq            | `<blockquote class="lq">                                       ` | `>`                 | pre mono      | &grave;             |
| menucascade   | `<span class="ph menucascade"><span class="ph uicontrol"> &gt; ` | [html]              | bold          | `**` or `__`        |
| msgblock      | `<pre class="pre msgblock"><code>                              ` | &grave; pre         | pre mono      | &grave;             |
| msgnum        | `<span class="keyword msgnum">                                 ` | [html]              | mono          | &grave;             |
| msgph         | `<samp class="ph msgph">                                       ` | [html]              | mono          | &grave;             |
| note          | `<div class="note note">                                       ` | [no tags]           |               |                     |
| notetitle     | `<span class="notetitle">Note:                                 ` | [html]              | bold          | `**` or `__`        |
| ol            | `<ol class="ol"><li class="li">                                ` | 1.  [? sub-lists]   | numbers       | 1.                  |
| option        | `<span class="keyword option">optional ... etc                 ` | [html]              | mono          | &grave;             |
| p             | `<p class="p">                                                 ` | [blank line]        |               |                     |
| parml         | `<dl class="dl parml">                                         ` | [no tagging]        | [as dl]       |                     |
|               | `<dt class="dt pt dlterm">                                     ` | [no tagging]        |               |                     |
|             	| `<dd class="dd pd">                                            ` | [no tagging]        |               |                     |
| parmname      | `<span class="keyword parmname parmname">                      ` | [html]              | bold          | `**` or `__`        |
| ph            | `<span class="ph">                                             ` | [html]              |               |                     |
| pre           | `<pre class="pre">                                             ` | &grave; pre         | pre           | &grave;             |
| q             | `<span class="q">                                              ` | [html]              | italic        | `*` or `_`          |
| screen        | `<pre class="pre screen"><code>                                ` | &grave; pre         | pre mono      | &grave;             |
| sli           | `<ul class="sl simple">                                        ` | [no tagging]        | [as ul]       |                     |
|               | `<li class="sli">                                              ` | -                   |               |                     |
| systemoutput  | `<samp class="ph systemoutput">                                ` | [html]              | mono          | &grave;             |
| term          | `<dfn class="term">                                            ` | [html]              | italic        | `*` or `_`          |
| tt            | `<samp class="ph tt">                                          ` | [html]              | mono          | &grave;             |
| u             | `<u class="ph u">                                              ` | [html]              | ?             |                     |
| uicontrol     | `<span class="ph uicontrol">                                   ` | [html]              | bold          | `**` or `__`        |
| ul            | `<ul class="ul"> <li class="li">                               ` | [no tagging]        | bullets       | -                   |
| userinput     | `<kbd class="ph userinput">                                    ` | [html]              | mono          | &grave;             |
| varname       | `<var class="keyword varname">                                 ` | [html]              | bold          | `**` or `__`        |
| wintitle      | `<span class="keyword wintitle">                               ` | [html]              | -             |                     |
| xref          | `<a class="xref" href="http://xyz" target="_blank" title="hover_text">link_text</a>` | [html] |        | (link_text)[http://xyz "hover_text"]                |
                                                                                                                               