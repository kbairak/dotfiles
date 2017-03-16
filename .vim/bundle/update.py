import os
import subprocess
import sys


URLS = (
    "git://github.com/FredKSchott/CoVim.git",
    "git://github.com/Lokaltog/vim-easymotion.git",
    "git://github.com/SirVer/ultisnips.git",
    "git://github.com/Valloric/YouCompleteMe.git",
    "git://github.com/cwood/vim-less.git",
    "git://github.com/ervandew/supertab.git",
    "git://github.com/ghadjikyriacou/NERDTreeOpenWithApp.git",
    "git://github.com/goldfeld/ctrlr.vim.git",
    "git://github.com/honza/vim-snippets.git",
    "git://github.com/kbairak/TurboMark.git",
    "git://github.com/kchmck/vim-coffee-script.git",
    "git://github.com/kien/ctrlp.vim.git",
    "git://github.com/kien/rainbow_parentheses.vim.git",
    "git://github.com/mattn/emmet-vim.git",
    "git://github.com/mileszs/ack.vim.git",
    "git://github.com/mxw/vim-jsx.git",
    "git://github.com/mxw/vim-jsx.git",
    "git://github.com/nvie/vim-flake8.git",
    "git://github.com/orenhe/pylint.vim.git",
    "git://github.com/pangloss/vim-javascript.git",
    "git://github.com/pangloss/vim-javascript.git",
    "git://github.com/rking/ag.vim.git",
    "git://github.com/scrooloose/nerdtree.git",
    "git://github.com/scrooloose/syntastic.git",
    "git://github.com/sjl/gundo.vim.git",
    "git://github.com/tpope/vim-fugitive.git",
    "git://github.com/tpope/vim-repeat.git",
    "git://github.com/tpope/vim-speeddating.git",
    "git://github.com/tpope/vim-surround.git",
    "git://github.com/vhdirk/vim-cmake.git",
    "git://github.com/vim-scripts/Conque-Shell.git",
    "git://github.com/vim-scripts/Mark.git",
    "git://github.com/vim-scripts/YankRing.vim.git",
    "git://github.com/vim-scripts/a.vim.git",
    "git://github.com/vim-scripts/loremipsum.git",
    "git://github.com/vim-scripts/pythoncomplete.git",
    "https://github.com/plasticboy/vim-markdown",
    'git://github.com/marijnh/tern_for_vim.git',
    'git://github.com/mjbrownie/vim-htmldjango_omnicomplete.git',
    'git://github.com/othree/html5.vim.git',
    'git://github.com/vim-scripts/matchit.zip.git',
)


def get_url(plugin):
    try:
        return [url for url in URLS if plugin.lower() in url.lower()][0]
    except IndexError:
        print "Plugin not found"


def update_plugin(plugin=None, url=None):
    url = url or get_url(plugin)
    folder_name = ".".join(
        url.split('/')[-1].split('.')[:-1]
    )
    print
    print " * %s:" % folder_name
    if os.path.exists(folder_name):
        os.chdir(folder_name)
        return_value = subprocess.call(("git", "pull", "--ff-only"))
        os.chdir(os.path.pardir)
    else:
        return_value = subprocess.call(("git", "clone", url))

    if return_value != 0:
        print "Error while updating '%s'" % (plugin or folder_name)


def main():
    if len(sys.argv) >= 2:
        for plugin in sys.argv[1:]:
            update_plugin(plugin=plugin)
    else:
        for url in URLS:
            update_plugin(url=url)

if __name__ == "__main__":
    main()
