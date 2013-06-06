set guifont=Ricty_Discord:h10
if has('win32')
    set dir=C:\cygwin\tmp
    set backupdir=C:\cygwin\tmp
    set undodir=C:\cygwin\tmp
    set renderoptions=type:directx,gamma:1.8,contrast:1,level:1,geom:0,renmode:5,taamode:1
endif

if has('mac')
    set antialias                 " 文字をなめらかに表示する
    set fuoptions=maxvert,maxhorz " フルスクリーン時に表示を拡張
    "au GUIEnter * set fullscreen  " 起動時にフルスクリーン
    set macmeta                   " option キーを alt キーとして使う
endif

set printfont=Ricty_Discord:h10 " 印刷用フォント
set printoptions=number:y " 印刷時に行番号を付ける
set visualbell            " ビープ音を使わず画面をフラッシュさせる
set iminsert=0            " インサートモードの初期値は IME OFF
set imsearch=-1           " 挿入モードの初期値は iminsert に従う
set mouse=a               " あらゆる場面でマウスを有効化
set clipboard=            " クリップボードのオプションはなし
set guioptions=A          " モードレスセレクションに対する自動選択
set linespace=0           " 行間を空けない
set ambiwidth=single      " 特殊文字に半角文字を使う
set title                 " ウィンドウタイトルを更新する
winsize 130 50            " ウィンドウの大きさを指定する
winpos 400 200            " ウィンドウの場所を指定する

"colorscheme desert-warm-256
"colorscheme bubblegum
"colorscheme neon-PK
"colorscheme zenburn
"colorscheme papayawhip
"colorscheme gummybears
"colorscheme void
"colorscheme badwolf
"colorscheme festoon
"colorscheme solarized
"colorscheme gruvbox
"set background=dark       " 背景は暗くする
"colorscheme solarized
colorscheme hemisu
