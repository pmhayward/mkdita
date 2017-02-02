Tagging example
===============

This abstract text appears before the short description. <span class="shortdesc">This text is the short description.</span> This abstract text appears after the short description.

Before you begin
----------------

&lt;prereq&gt; You need to do this first.
A little prereq paragraph.

About this task
---------------

This is what it is - in a concept topic, anyway!

&lt;context&gt; The preamble to the task... Included here are all the general highlighting tags:
--------------------------------------------------------------------

<span class="keyword apiname">apiname</span>

The &lt;apiname&gt; element provides the name of an application programming interface (API) such as a Java class name or method name. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.

--------------------------------------------------------------------

**bold**

The bold (&lt;b&gt;) element is used to apply bold highlighting to the content of the element. Use this element only when there is not some other more proper tag. For example, for specific items such as GUI controls, use the uicontrol tag. This element is part of the DITA highlighting domain.

--------------------------------------------------------------------

<span class="boolean" style="color:green">boolean: yes</span>

The &lt;boolean&gt; element is used to express one of two opposite values, such as yes or no, on or off, true or false, high or low, and so forth. The element itself is empty; the value of the element is stored in its state attribute, and the semantic associated with the value is typically in a specialized name derived from this element. If you need more than two values (for example, "yes," "no" and "don't care") use the &lt;state&gt; element instead. This element is primarily for specialization, where it can be used to require a logical true or false designation in a particular part of the document.

--------------------------------------------------------------------

<span class="keyword calloutlabel"> calloutlabel </span>

The callout label (&lt;calloutlabel&gt;) element represents a graphic or program listing callout. It usually appears as a reverse-image letter or number.

--------------------------------------------------------------------

<cite class="cite">cite</cite>

<cite class="cite hardcopy">hardcopy</cite>

<cite class="cite book">book</cite>

<cite class="cite infocenter">infocenter</cite>

<cite class="cite www">www</cite>

The &lt;cite&gt; element is used when you need a bibliographic citation that refers to a book or article. It specifically identifies the title of the resource. Its keyref attribute allows the citation to be associated to other possible bibliographic processing (not supported yet).

--------------------------------------------------------------------

<span class="keyword cmdname">cmdname</span>

The command name (&lt;cmdname&gt;) element specifies the name of a command when it is part of a software discussion. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.

--------------------------------------------------------------------

``` pre
codeblock1
codeblock2
codeblock3
```

The &lt;codeblock&gt; element represents lines of program code. Like the &lt;pre&gt; element, content of this element has preserved line endings and is output in a monospaced font. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.

--------------------------------------------------------------------

<samp class="ph codeph">codeph</samp>

The code phrase (&lt;codeph&gt;) element represents a snippet of code within the main flow of text. The code phrase may be displayed in a monospaced font for emphasis. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.

--------------------------------------------------------------------

**dt header**  
**dd header**

dt 1  
dd 1

dt 2  
dd 2

A definition list (&lt;dl&gt;) is a list of terms and corresponding definitions. The term (&lt;dt&gt;) is usually flush left. The description or definition (&lt;dt&gt;) is usually either indented and on the next line, or on the same line to the right of the term.

You can also provide an optional heading for the terms and definitions, using the &lt;dlhead&gt; element, which contains header elements for those columns. The default formatting for the &lt;dlhead&gt; looks like a table with a heading row.

--------------------------------------------------------------------

**t**  
**dd header**

1  
dd 1

2  
dd 2

A compact definition list...

--------------------------------------------------------------------

The &lt;draft-comment&gt; element allows simple review and discussion of topic contents within the marked-up content. Use the &lt;draft-comment&gt; element to ask a question or make a comment that you would like others to review. To indicate the source of the draft comment or the status of the comment, use the author, time or disposition attributes.

Note: Your processing system will provide a run-time flag or parameter to cause the content of this element to be specially displayed for draft output only. By default, it is stripped out to prevent publishing internal comments by mistake!.

--------------------------------------------------------------------

<span class="ph filepath">filepath</span>

The &lt;filepath&gt; element indicates the name and optionally the location of a referenced file by specifying the directory containing the file, and other directories that may precede it in the system hierarchy. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.

--------------------------------------------------------------------

<a href="#fntarg_1" id="fnsrc_1"><sup>1</sup></a>

Use footnote (&lt;fn&gt;) to annotate text with notes that are not appropriate for inclusion in line or to indicate the source for facts or other material used in the text. Footnote content is always skipped at the place where it was entered, and reproduced elsewhere.

--------------------------------------------------------------------

<img src="hand.gif" alt="Picture of a pointing hand" class="image" />

Include artwork or images in a DITA topic by using the &lt;image&gt; element. The &lt;image&gt; element has optional attributes that indicate whether the placement of the included graphic or artwork should be inline (like a button or icon), or on a separate line for a larger image. An href attribute is required on the image element, as this attribute creates a pointer to the image, and allows the output formatting processor to bring the image into the text flow. To make the intent of the image more accessible for users using screen readers or text-only readers, always include a description of the image's content in the alt element.
--------------------------------------------------------------------

*i*

The italic (&lt;i&gt;) element is used to apply italic highlighting to the content of the element. Use this element only when there is not some other more proper tag. For example, for specific items such as GUI controls, use the &lt;uicontrol&gt; tag. Italic highlighting generally means a font that is slanted for emphasis, but this may vary depending on your output formatting process. This element is part of the DITA highlighting domain.

--------------------------------------------------------------------

indexterm

An &lt;indexterm&gt; is an index entry. You can nest entries to create multi-level indexes. The content is not output as part of topic content, only as part of the index.

When DITA topics are output to XHTML, any keyword or indexterm elements in the &lt;keywords&gt; element are placed in the Web page metadata. In addition, the indexterms are added to supported index processing (for example, for print versions).

--------------------------------------------------------------------

<span class="keyword">keyword</span>

The &lt;keyword&gt; element identifies a keyword or token, such as a single value from an enumerated list, the name of a command or parameter, product name, or a lookup key for a message (contrast with &lt;term&gt;).

"Keyword" means any text that has a unique or key-like value. For example, a product name. Where there is a element that has a better meaning for what you are describing, use that element; for example: use &lt;apiname&gt; for API names and &lt;cmdname&gt; for command names. The keyword element is a generic element; use it when no other element applies. The keyword element can also be used for reusable text. &lt;term&gt; should be used for inline paragraph definitions; to indicate what you're defining. &lt;ph&gt; should be used for general phrases; when you think that keyword is not appropriate. Inside syntax diagrams and syntax phrases, use kwd to indicate a programming keyword. In metadata, a keyword is used to create additional XHTML metadata.

Specialized elements derived from &lt;keyword&gt; may also have extended processing, such as different formatting or automatic indexing. If the keyref attribute is used, the keyword can be turned into a hyperlink on output (not currently supported).

When DITA topics are output to XHTML, any &lt;keyword&gt; or &lt;indexterm&gt; elements in the &lt;keywords&gt; metadata element are placed in the Web page metadata. In addition, any index terms in this context are also used for supported index processing (for example, for print versions).

--------------------------------------------------------------------

lines 1
lines 2

The &lt;lines&gt; element may be used to represent dialogs, lists, text fragments, and so forth. The &lt;lines&gt; element is similar to &lt;pre&gt; in that hard line breaks are preserved, but the font style is not set to monospace, and extra spaces inside the lines are not preserved.

--------------------------------------------------------------------

> lq - Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

The long quote (&lt;lq&gt;) element indicates content quoted from another source. Use the quote element &lt;q&gt; for short, inline quotations, and long quote &lt;lq&gt; for quotations that are too long for inline use, following normal guidelines for quoting other sources. You can store a URL to the source of the quotation in the href attribute.

--------------------------------------------------------------------

<span class="ph menucascade"><span class="ph uicontrol"><span class="keyword shortcut">M</span>enucascade-uicontrol 1</span> &gt; <span class="ph uicontrol">menucascade-uicontrol 2</span></span>

The &lt;menucascade&gt; element is used to document a series of menu choices, or to show any choice on a menu from which the user needs to choose. The &lt;menucascade&gt; element contains one or more user interface control (&lt;uicontrol&gt;) elements. If there is more than one &lt;uicontrol&gt; element, the formatter may show connecting characters between the menu items to represent the menu cascade. This element is part of the DITA user interface domain, a special set of DITA elements designed to document user interface tasks, concepts and reference information.

--------------------------------------------------------------------

``` pre
msgblock 1
msgblock 2
```

The message block (&lt;msgblock&gt;) element contains a multi-line message or set of messages. The message block can contain multiple message numbers and message descriptions, each enclosed in a &lt;msgnum&gt; and &lt;msgph&gt; element. It can also contain the message content directly. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.

--------------------------------------------------------------------

<span class="keyword msgnum">msgnum</span>

The message number (&lt;msgnum&gt;) element contains the number of a message produced by an application or program. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information. Contained by &lt;msgph&gt;, &lt;msgblock&gt;

--------------------------------------------------------------------

<samp class="ph msgph">msgph</samp>

The message phrase (&lt;msgph&gt;) element contains the text content of a message produced by an application or program. It can also contain the variable name (&lt;varname&gt;) element to illustrate where variable text content can occur in the message. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information. Contains text data or &lt;varname&gt; or &lt;msgnum&gt;

--------------------------------------------------------------------

<span class="notetitle">Note:</span> note

A &lt;note&gt; element contains information, differentiated from the main text, which expands on or calls attention to a particular point.

<span class="notetitle">Note:</span> Variant types of note (attention, caution, danger, fastpath, important, note, other, remember, restriction, tip) can be indicated through values selected on the type attribute. This note is typed as a "tip."

--------------------------------------------------------------------

<object id="create_manufacturers_better" codebase="http://download.macromedia.com/pub/shockwave/cabs/ flash/swflash.cab#version=6,0,0,0" type="application/x-shockwave-flash" height="560" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" data="create_manufacturers_better.swf" width="740"><span>Some info about create\_manufacturers\_better.swf</span><param name="movie" value="create_manufacturers_better.swf"></param><param name="quality" value="high"></param><param name="bgcolor" value="#FFFFFF"></param><embed name="create_manufacturers_better" height="560" width="740" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" src="create_manufacturers_better.swf" quality="high" bgcolor="#FFFFFF" alt="Some info about create_manufacturers_better.swf"></embed><noembed>Some info about create\_manufacturers\_better.swf</noembed></object>

--------------------------------------------------------------------

1.  ol-li 1
    1.  2.  3.  1.  2.  3.  

2.  ol-li 2

An ordered list (&lt;ol&gt;) is a list of items sorted by sequence or order of importance. Contains &lt;li&gt;

--------------------------------------------------------------------

<span class="keyword option">option</span>
<span class="keyword option">obsolete</span> ...
<span class="keyword option">deprecated</span> ...
<span class="keyword option">optional</span> ...
<span class="keyword option">default</span> ...
<span class="keyword option">low</span> ...
<span class="keyword option">normal</span> ...
<span class="keyword option">high</span> ...
<span class="keyword option">recommended</span> ...
<span class="keyword option">required</span> ...
<span class="keyword option">urgent</span> ...
<span class="keyword option msobjprop">outputclass="msobjprop"</span>

The &lt;option&gt; element describes an option that can be used to modify a command (or something else, like a configuration). This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.

--------------------------------------------------------------------

p

A paragraph element (&lt;p&gt;) is a block of text containing a single main idea.

--------------------------------------------------------------------

--&gt;
parml-pt 1  
parml-pd 1

parml-pt 2  
parml-pd 2

The parameter list (&lt;parml&gt;) element contains a list of terms and definitions that describes the parameters in an application programming interface. This is a special kind of definition list that is designed for computer parameters. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.

--------------------------------------------------------------------

<span class="keyword parmname parmname">parmname</span>

When referencing the name of an application programming interface parameter within the text flow of your topic, use the parameter name (&lt;parmname&gt;) element to markup the parameter. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.

<span class="keyword parmname defparmname">default</span>

Use &lt;parmname importance="default"&gt; to indicate a default parameter. (Should this be on &lt;option&gt;, though?)

--------------------------------------------------------------------

<span class="ph">ph</span>

The phrase (&lt;ph&gt;) element is used to organize content for reuse or conditional processing (for example, when part of a paragraph applies to a particular audience). It can be used by future specializations of DITA to apply specific processing or formatting to marked up phrases.

--------------------------------------------------------------------

``` pre
pre 1
pre  2
pre   3
```

The preformatted element (&lt;pre&gt;) preserves line breaks and spaces entered manually by the author in the content of the element, and also presents the content in a monospaced type font (depending on your output formatting processor).

--------------------------------------------------------------------

<span class="q">"q - Lorem ipsum dolor sit amet"</span>

A quotation element (&lt;q&gt;) indicates content quoted from another source. This element is used for short quotes which are displayed inline. Use the long quote element (&lt;lq&gt;) for quotations that should be set off from the surrounding text.

--------------------------------------------------------------------

``` pre
screen 1
screen 2
```

The &lt;screen&gt; element contains or refers to a textual representation of a computer screen or user interface panel (window).

Use &lt;screen&gt; to contain representations of text-based online panels, text consoles ("term" or "curses" windows, for example), or other text-based user interface components. The default print representation is to enclose the screen within a box, suggesting a computer display screen. In contrast to graphical screen captures normally used to represent GUI parts, this element specifically supports constructions for which text is the primary content.

This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.

--------------------------------------------------------------------

-   sl-sli 1
-   sl-sli 2

The &lt;sl&gt; element contains a simple list of items of short, phrase-like content, such as in documenting the materials in a kit or package.

--------------------------------------------------------------------

<span class="state" style="color:red">state: ABC=XYZ</span>

The &lt;state&gt; element specifies a name/value pair whenever it is necessary to represent a named state that has a variable value. The element is primarily intended for use in specializations to represent specific states (like logic circuit states, chemical reaction states, airplane instrumentation states, and so forth).

--------------------------------------------------------------------

<sub>sub</sub>

A subscript (&lt;sub&gt;) indicates that text should be subscripted, or placed lower in relationship to the surrounding text. Subscripted text is often a smaller font than the surrounding text. Formatting may vary depending on your output process. This element is part of the DITA highlighting domain.

--------------------------------------------------------------------

<sup>sup</sup>

The superscript (&lt;sup&gt;) element indicates that text should be superscripted, or vertically raised in relationship to the surrounding text. Superscripts are usually a smaller font than the surrounding text. This element is part of the DITA highlighting domain.

--------------------------------------------------------------------

<span class="ph synph">synph</span>

<span class="ph synph"><samp class="ph codeph">codeph</samp> <span class="keyword option">option</span> <span class="keyword parmname parmname">parmname</span> <span class="ph var">var</span> <span class="keyword kwd">kwd</span> <span class="ph oper">oper</span> <span class="ph delim">delim</span> <span class="ph sep">sep</span></span>
The syntax phrase (&lt;synph&gt;) element is a container for syntax definition elements. It is used when a complete syntax definition is not needed, but some of the syntax elements, such as &lt;option&gt;, &lt;parmname&gt;, kwd, oper, delim, are used within the text flow of the topic content. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.

The &lt;var&gt; element defines a variable for which the user must supply content, such as their user name or password. It is represented in output in an italic font. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information. Contained by &lt;synph&gt;

&lt;syntaxdiagram&gt; and &lt;synph&gt;:The syntax diagram and syntax phrase elements, and all they contain, are deliberately omitted; might think about them later, but life might be too short :-)

--------------------------------------------------------------------

<samp class="ph systemoutput">systemoutput</samp>

The system output (&lt;systemoutput&gt;) element represents computer output or responses to a command or situation. A generalized element, it represents any kind of output from the computer, so the author may wish to choose more specific markup, such as &lt;msgph&gt;, for messages from the application. The system output element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.

--------------------------------------------------------------------

<dfn class="term">term</dfn>

The &lt;term&gt; element identifies words that represent extended definitions or explanations. In future development of DITA, for example, terms might provide associative linking to matching glossary entries.

--------------------------------------------------------------------

DB2®

The trademark (&lt;tm&gt;) element in DITA is used to markup and identify a term or phrase that is trademarked. Trademarks include registered trademarks, service marks, slogans and logos.

<span class="remembertitle">Remember:</span> In your company's documents, these attributes should only be set with an approved editor that follows corporate rules for nesting trademarks and setting attribute properties. The business rules for indicating and displaying trademarks may differ from company to company and must be enforced by authoring policy and by specific processing.

--------------------------------------------------------------------

<samp class="ph tt">tt</samp>

The teletype (&lt;tt&gt;) element is used to apply monospaced highlighting to the content of the element. Use this element only when there is not some other more proper tag. For example, for specific items such as GUI controls, use the &lt;uicontrol&gt; tag. This element is part of the DITA highlighting domain.

--------------------------------------------------------------------

<u class="ph u">u</u>

The underline (&lt;u&gt;) element is used to apply underline highlighting to the content of the element. Use this element only when there is not some other more proper tag. For example, for specific items such as GUI controls, use the &lt;uicontrol&gt; tag. This element is part of the DITA highlighting domain.

--------------------------------------------------------------------

<span class="ph uicontrol">uicontrol</span>

The user interface control (&lt;uicontrol&gt;) element represents a button, entry field, menu item, or other object that allows the user to control the interface. This could also include a menu or dialog. For example, use the &lt;uicontrol&gt; element inside a &lt;menucascade&gt; element when the menu item is nested, such as <span class="ph menucascade"><span class="ph uicontrol">File</span> &gt; <span class="ph uicontrol">New</span></span>. This element is part of the DITA user interface domain, a special set of DITA elements designed to document user interface tasks, concepts and reference information.

--------------------------------------------------------------------

-   ul-li 1
-   ul-li 2

In an unordered list (&lt;ul&gt;), the order of the list items is not significant. List items are typically styled on output with a "bullet" character, depending on nesting level.

--------------------------------------------------------------------

<kbd class="ph userinput">userinput</kbd>

The user input (&lt;userinput&gt;) element represens the text a user should input in response to a program or system prompt. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.

--------------------------------------------------------------------

<var class="keyword varname">varname</var>

The variable name (&lt;varname&gt;) element defines a variable that must be supplied to a software application. The variable name element is very similar to the variable (&lt;var&gt;) element, but variable name is used outside of syntax diagrams, possibly within a message or API description to describe a system variable or environment variable. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.

--------------------------------------------------------------------

<span class="keyword wintitle">wintitle</span>

The window title (&lt;wintitle&gt;) element represents the title text that appears at the top of a window or dialog, and applies to wizard titles, wizard page titles, and pane titles. This element is part of the DITA user interface domain, a special set of DITA elements designed to document user interface tasks, concepts and reference information.

--------------------------------------------------------------------

<a href="http://www.bbc.co.uk" class="xref" title="(Opens in a new tab or window)">xref</a> Use to link to a different location within the current topic, or a different topic within the same help system, or to external sources, such as Web pages, or to a location in another topic. The href attribute on the &lt;xref&gt; element provides the location of the target.
--------------------------------------------------------------------

| Header1 | Header2 |
|---------|---------|
| a1      | a2      |
| b1      | b2      |

| Type style | Elements used |
|------------|---------------|
| Bold       | b             |
| Italic     | i             |
| Underlined | u             |

1.  Is your broker installed on a UNIX machine?
    -   <span class="ph no">No:</span> Go to the next question
    -   <span class="ph yes">Yes:</span> I'm sorry for you

        Go somewhere else instead

2.  Etc...

Procedure
---------

Do the following steps to feed your bat.

1.  <span class="ph cmd">Is your broker installed on a UNIX machine?</span>
    1.  <span class="ph cmd"><span class="ph no">No:</span> Go to the next question</span>
    2.  <span class="ph cmd"><span class="ph yes">Yes:</span> I'm sorry for you</span>
2.  Optional: <span class="ph cmd">-opt-Do this</span> Tutorial information...
    | Option       | Description             |
    |--------------|-------------------------|
    | **Option 1** | Description of option 1 |
    | **Option 2** | Description of option 2 |

    Step result
3.  <span class="ph cmd">Then this</span>
    1.  <span class="ph cmd">which is done by doing this</span> Substep result
    2.  <span class="ph cmd">and then this.</span> Step example...
4.  <span class="ph cmd">And this.</span>
    -   If this is a that, then do something.
    -   Else if this is an other, then do something else.
5.  <span class="ph cmd">And finally, this.</span>
    -   If you have a remote server you want to test on, type the IP address or hostname of the server here.
    -   If you want to do local testing, just type localhost.

    Step example... Step result...

Results
-------

&lt;result&gt; This is what you have now achieved.

Example
-------

&lt;example&gt; Here's an example... Insert tab A into slot B.

What to do next
---------------

&lt;postreq&gt; Now, you too can do this...

<a href="#fnsrc_1" id="fntarg_1"><sup>1</sup></a> fn
