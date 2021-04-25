# json2ts.vim

json2ts.vim is a vim plugin and converts a JSON from clipboard to TypeScript interfaces.

## Install

1. Install `node.js` and `npm`
1. Install this plugin
   - Installation with Vim-Plug
     1. add content in `.vimrc`: `Plugin 'FuDesign2008/json2ts.vim', { 'do': 'npm install' }`
   - Installation with Vundle
     1. add content in `.vimrc` `Plugin 'FuDesign2008/json2ts.vim'`
     1. `cd ~/.vim/bundle/json2ts.vim && npm install`

## Usage

### Command

1. `:Json2ts` Convert a JSON from clipboard to TypeScript interfaces and append to current line.

### Keymap

1. `<leader>t` Execute `:Json2ts` command

### Options

1. `g:json2ts_custom_keymap` Use custom keymap or not
   - default is `false`
   - If set to `true`, `<leader>t` will be disabled

## Reference

- [json2ts for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=GregorBiswanger.json2ts)
- [GitHub - GregorBiswanger/json2ts: Convert a JSON to TypeScript interfaces.](https://github.com/GregorBiswanger/json2ts)
