# vimfiles, a configuration of plugins and settings.

This is an early cut of making some Vim related dotfile love. The idea is to use 
Git to keep it all in check, and make it easy to fork and amend.

all in this should be simple and easy to use.

## installing

installing this is simple. If you haven't got a vim setup going, run install.sh from within the repo, or directly by doing:

    \curl -sSL https://github.com/imajes/vimfiles/blob/master/install.sh | bash

please submit issues or similar if there are any suggestions or requests.

## about the folder

The organization of this folder is pretty simple:

## ./.vimrc
here, there's .vimrc. it's the first point for all of these files

## ./vimrc.d/0_plug.vim:
the brains behind the way vundle et al are sourced; this allows for the rest
of the plugin system.


## ./vimrc.d/plugins:

* **00_prerequisites.vim** - this is for anything that must happen before all else
* **01_defaults.vim**      - for globally setting anything that helps 'reset' and
                            create a clear setting
* **10_**                 - currently unused
* **20_**                 - vundled plugins over all filetypes. colors, comments, syntax.
* **30_**                 - functions and more complex packages
* **40_**                 - currently unused
* **50_**                 - vundled plugins for language and syntax.
* **75_**                 - utility tools, moving stuff in and out of vim (e.g.
                            stories, or tasks)
* **80_**                 - disabling stuff and ensuring stuff doesn't get in the
                            way
* **99_template.vim**     - template file for these here plugin settings


### notes about this repo

This is an early cut of making some Vim related dotfile love. The idea is to use 
Git to keep it all in check, and make it easy to fork and amend.

all in this should be simple and easy to use.

Use with love. :heart:
