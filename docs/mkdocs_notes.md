# MkDocs - notes

See [http://www.mkdocs.org/](http://www.mkdocs.org/) for details.

## Installing MkDocs

1. Needs Python installed. (N.B. Possibly because Python isn't set up properly on my computer, I need to preface every Python command with `python -m`.)

2. Use the Python package manager, `pip`, to install MkDocs:

        C:\>python -m pip install mkdocs

3. Check that everything works okay:

        C:\>python -m mkdocs --version
        __main__.py, version 0.16.1

4. Make a new project. `cd` to preferred location and run:

        C:\>python -m mkdocs new <my_project>

    This creates a new dir called `<my_project>` with a file called `mkdocs.yml` (for the TOC and other config stuff), and a subdirectory called (by default) `docs` where you put your `.md` files etc. It already has a default `index.md` file. This file is required, but you can change its content.
    
    You can add all sorts of attributes to the `.yml` file to change the output. The most powerful is to change the theme entirely, but existing themes can be modified with extra CSS.


## Summary of MkDocs commands and options

| Commands          |                                                  |
|-------------------|--------------------------------------------------|
| `new        `     | Create a new MkDocs project                      |
| `build      `     | Build the MkDocs documentation                   |
| `json       `     | Build the MkDocs documentation to JSON files     |
| `gh-deploy  `     | Deploy your documentation to GitHub Pages        |
| `serve      `     | Run the built-in development server              |
                    
| Options:          |                                                  |
|-------------------|--------------------------------------------------|
| `-V`, `--version` | Display MkDocs version                           |
| `-q`, `--quiet  ` | Silence warnings                                 |
| `-v`, `--verbose` | Enable verbose output                            |
| `-h`, `--help   ` | Show this message and exit.                      |


  

## Creating an MkDocs project

`cd` to preferred location and run:

    C:\>python -m mkdocs new <my_project>

This creates a new dir called `<my_project>` with a file called `mkdocs.yml` (for the TOC and other config stuff), and a subdirectory called (by default) `docs` where you put your `.md` files etc. It already has a default `index.md` file. This file is required, but you can change its content.

You can add all sorts of attributes to the `.yml` file to change the output. The most powerful is to change the theme entirely, but existing themes can be modified with extra CSS.

## Creating content - using Pandoc

1. Content originated in DITA and was transformed via our normal build process to HTML. This takes care of things such as:
    - Ditaval exclusions
    - Conrefs
    - Standard text in task topics
    - Correct formatting of `<menucascade>` elements
    - Trademarks
    - Creation of child/parent links
    - Draft comments

2. [Pandoc](http://pandoc.org/index.html) ("a universal document converter") was used to transform HTML to `.md` files (and to `.rst`). Download `pandoc-1.19.1-windows.msi` from [GitHub (jgm/pandoc)](https://github.com/jgm/pandoc/releases) and run it to install.

3. Check that everything works okay:

        C:\>pandoc --version
        pandoc 1.19.1
        ...

4. Pandoc is a command-line tool. Refer to the [User Guide](http://pandoc.org/MANUAL.html) for all possible parameters, but this is typical for simple transforms:

        C:\testtopics>pandoc test1.html -f html -t markdown -o test1.md 
        
    (even `-f` and `-t` are not required if you're happy to let Pandoc work out what to do from the file extensions).
    
    A simple batch file was used in this case to iterate through all the HTML files in a directory and transform them to the following versions of markdown:

    | Markdown version              | Pandoc `-t` attribute |
    |-------------------------------|-----------------------|
    | Pandoc's extended Markdown    | `markdown`            |
    | Original unextended Markdown  | `markdown_strict`     |
    | PHP Markdown Extra            | `markdown_phpextra`   |
    | GitHub-Flavored Markdown      | `markdown_github`     |
    | MultiMarkdown                 | `markdown_mmd`        |
    | CommonMark Markdown           | `commonmark`          |
    | *also:*                       |                       |
    | reStructuredText (REST)       | `rst`                 |


## Shiny-looking output

MkDocs comes with its own built in theme. [Other themes can be installed](https://github.com/mkdocs/mkdocs/wiki/MkDocs-Themes):

    C:\>python -m pip install <theme_name>

Add a stanza to the `mkdocs.yml` file:

    theme: <theme_name>

## Viewing output using built-in server

#### To view docs locally:

1. Start the MkDocs server from the directory where the `mkdocs.yml` file is:

        C:\mkdocs_test\my-project>python -m mkdocs serve

2. View the output in a local browser at `http://127.0.0.1:8000/`

#### To view docs from another computer:

1. Find your IP address. At a command prompt:

        C:\>ipconfig
        ...
        Wireless LAN adapter Wireless Network Connection:
           IPv4 Address. . . . . . . . . . . : 9.140.98.160
        ...

2. Start the MkDocs server from the directory where the `mkdocs.yml` file is, and specify the address and port you want to use:

        C:\mkdocs_test\my-project>python -m mkdocs serve --dev-addr=9.140.98.160:8001
        
3. View the output in any browser at `http://9.140.98.160:8001/`

## Building a web site

Run:

    C:\>python -m mkdocs build

This creates a new directory, named `site` that can be deployed to any server.

## Licences

- Pandoc: Released under the GPL (GNU General Public License).  (IBM G2O = IUA)
- MkDocs: Released under the BSD (Berkeley Software Distribution) licence.
- sphinx_rtd_theme (read-the-docs) theme for MkDocs: Released under the the MIT (Massachusetts Institute of Technology) License.