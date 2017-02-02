# Pandoc transforms

#### Git-Flavored Markdown (GFM)

The following table shows result of transforming DITA to Git-Flavored Markdown (GFM) via XHTML

- [html] implies that the HTML is carried over to the Markdown.
- [no tagging] means that HTML tags are removed in the Markdown.
- Tables are transformed from HTML by using pipes (|) and dashes (-).

#### CommonMark Markdown (CMD) differences

- `#` and `##` used instead of `===` and `---` respectively.
- `\<` and `\>` rather than `&gt;` and `&lt;`
- All tagging is removed that it doesn't understand (i.e. [no tagging] instead of [html] in following list) except...
- Tables are simply transfered as HTML.


| DITA element  | Transform to XHTML                                                                   | To GFM              | 
|---------------|--------------------------------------------------------------------------------------|---------------------|
| topic title   | `<h1 class="title topictitle1">                                                    ` | `===`               |
| abstract      | `<div class="abstract">                                                            ` | `---`               |
| shortdesc     | `<span class="shortdesc">                                                          ` | [html]              |
| apiname       | `<span class="keyword apiname">                                                    ` | [html]              |
| bold          | `<strong class="ph b">                                                             ` | `**`                |
| cite          | `<cite class="cite">                                                               ` | [html]              |
| cmdname       | `<span class="keyword cmdname">                                                    ` | [html]              |
| codeblock     | `<pre class="pre codeblock"><code>                                                 ` |       ``` pre       |
| codeph        | `<samp class="ph codeph">                                                          ` | [html]              |
| dl            | `<dl class="dl">                                                                   ` | [no tagging]        |
|               | `<dt class="dthd"><strong>                                                         ` | `**`                |
|               | `<dd class="ddhd"><strong>                                                         ` | `**`                |
|               | `<dt class="dt dlterm">                                                            ` | [no tagging]        |
|               | `<dd class="dd">                                                                   ` | [no tagging]        |
| filepath      | `<span class="ph filepath">                                                        ` | [html]              |
| image         | `<img class="image" src="hand.gif" alt="alt_text" />                               ` | [html]              |
| i             | `<em class="ph i">                                                                 ` | `*`                 |
| keyword       | `<span class="keyword">                                                            ` | [html]              |
| lines         | `<p class="lines"> ... <br />                                                      ` | [no tagging]        |
| lq            | `<blockquote class="lq">                                                           ` | `>`                 |
| menucascade   | `<span class="ph menucascade"><span class="ph uicontrol"> &gt;                     ` | [html]              |
| msgblock      | `<pre class="pre msgblock"><code>                                                  ` |       ``` pre       |
| msgnum        | `<span class="keyword msgnum">                                                     ` | [html]              |
| msgph         | `<samp class="ph msgph">                                                           ` | [html]              |
| note          | `<div class="note note">                                                           ` | [no tags]           |
| notetitle     | `<span class="notetitle">Note:                                                     ` | [html]              |
| ol            | `<ol class="ol"><li class="li">                                                    ` | `1.`  [? sub-lists] |
| option        | `<span class="keyword option">optional ... etc                                     ` | [html]              |
| p             | `<p class="p">                                                                     ` | [blank line]        |
| parml         | `<dl class="dl parml">                                                             ` | [no tagging]        |
|               | `<dt class="dt pt dlterm">                                                         ` | [no tagging]        |
|             	| `<dd class="dd pd">                                                                ` | [no tagging]        |
| parmname      | `<span class="keyword parmname parmname">                                          ` | [html]              |
| ph            | `<span class="ph">                                                                 ` | [html]              |
| pre           | `<pre class="pre">                                                                 ` |       ``` pre       |
| q             | `<span class="q">                                                                  ` | [html]              |
| screen        | `<pre class="pre screen"><code>                                                    ` |       ``` pre       |
| sli           | `<ul class="sl simple">                                                            ` | [no tagging]        |
|               | `<li class="sli">                                                                  ` | `-`                 |
| systemoutput  | `<samp class="ph systemoutput">                                                    ` | [html]              |
| term          | `<dfn class="term">                                                                ` | [html]              |
| tt            | `<samp class="ph tt">                                                              ` | [html]              |
| u             | `<u class="ph u">                                                                  ` | [html]              |
| uicontrol     | `<span class="ph uicontrol">                                                       ` | [html]              |
| ul            | `<ul class="ul">                                                                   ` | [no tagging]        |
|               | `<li class="li">                                                                   ` | `-`                 |
| userinput     | `<kbd class="ph userinput">                                                        ` | [html]              |
| varname       | `<var class="keyword varname">                                                     ` | [html]              |
| wintitle      | `<span class="keyword wintitle">                                                   ` | [html]              |
| xref          | `<a class="xref" href="http://xyz" target="_blank" title="hover_text">link_text</a>` | [html]              |
