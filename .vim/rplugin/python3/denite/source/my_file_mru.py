# ============================================================================
# FILE: my_file_mru.py
# AUTHOR: delphinus <delphinus@remora.cx>
# License: MIT license
# ============================================================================

from .file_mru import Source as Base
import os.path


class Source(Base):

    def __init__(self, vim):
        super().__init__(vim)
        self.name = 'my_file_mru'

    def gather_candidates(self, context):
        return [{
            'word': word(self.vim, x),
            'abbr': abbr(self.vim, x),
            'action__path': x,
        } for x in self.vim.eval(
            'neomru#_get_mrus().file.'
            + 'gather_candidates([], {"is_redraw": 0})')]

    def highlight(self):
        highlight(self.vim, self.syntax_name)


ICON_SEP = '{0}_i_{0}'.format(chr(0xa0))
FILE_SEP = '{0}_f_{0}'.format(chr(0xa0))
SEP_RE = '{0}_._{0}'.format(chr(0xa0))


def word(vim, x):
    return vim.funcs.fnamemodify(x, ':~:.')

def abbr(vim, x):
    x = vim.funcs.fnamemodify(x, ':p:~')
    x = x.replace('~/.cache/dein/repos', '$DEIN')
    x = x.replace('~/.go/src', '$GO')
    icon = vim.funcs.WebDevIconsGetFileTypeSymbol(
        x, os.path.isdir(x))
    icon = ' {0} '.format(icon)
    directory = vim.funcs.fnamemodify(x, ':.:h') + '/'
    filename = vim.funcs.fnamemodify(x, ':t')
    return icon + ICON_SEP + directory + FILE_SEP + filename


def highlight(vim, syntax_name):
    com = vim.command
    com(r'syntax match {0}_Icon /\v .+ ({1})@=/ contained containedin={0}'.
        format(syntax_name, ICON_SEP))
    com('highlight default link {0}_Icon Function'.
        format(syntax_name))
    com(r'syntax match {0}_File /\v({1})@<=.*/ contained containedin={0}'.
        format(syntax_name, FILE_SEP))
    com('highlight default link {0}_File Directory'.
        format(syntax_name))
    com('syntax match {0}_Sep /{1}/ conceal contained containedin={0}'.
        format(syntax_name, SEP_RE))
    com(r'syntax match {0}_Special /\$[A-Z]\+/ contained containedin={0}'.
        format(syntax_name))
    com('highlight default link {0}_Special WildMenu'.
        format(syntax_name))