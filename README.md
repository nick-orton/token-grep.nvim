# token-grep.nvim

A Neovim plugin to search your project for tokens using ripgrep. Results are 
piped directly into the **QuickFix** list for easy navigation.

## 🚀 Features

* **Smart Search:** Uses `ripgrep` for blazing-fast performance.
* **Git-Aware:** Automatically ignores files and directories listed in your 
  `.gitignore`.
* **Context Aware:** If no argument is provided, it automatically searches for 
  the word under the cursor.
* **Smart Case:** Searches are case-insensitive unless you include an uppercase
  letter.

## 📋 Requirements

This plugin requires **[ripgrep (rg)](https://github.com/BurntSushi/ripgrep)** 
to be installed on your system.

* **FreeBSD:** `sudo pkg install ripgrep`
* **Ubuntu/Debian:** `sudo apt install ripgrep`

## 📦 Installation

Using **[vim-plug](https://github.com/junegunn/vim-plug)**:

```vim
Plug 'nick-orton/token-grep.nvim'

```

After adding this to your configuration, run `:PlugInstall`.

## 🛠 Usage

The plugin provides a single command:

| Command | Description |
| --- | --- |
| `:TokenGrep <token>` | Search for the specific `<token>` in the current directory tree. |
| `:TokenGrep` | Search for the **word currently under the cursor**. |

## ⌨️ Recommended Keybindings

To make the workflow even faster, you can add this to your `init.lua`:

```lua
-- Search for the word under the cursor with 'gh' (Get Here)
vim.keymap.set('n', 'gh', ':TokenGrep<CR>', { desc = 'Grep word under cursor' })

```

## ⚙️ How it Works

The plugin wraps the following system command:
`rg --vimgrep --smart-case -- <token>`

It then parses the output and populates the Neovim QuickFix list (`:copen`), 
allowing you to jump between matches using standard QuickFix commands like 
`:cnext` and `:cprev`.
