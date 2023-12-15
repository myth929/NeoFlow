# neovim config

## Install
```
# Linux / Macos (unix)
git clone https://github.com/myth929/NeoFlow.git ~/.config/nvim --depth 1 && nvim

# Windows
git clone https://github.com/myth929/NeoFlow.git $HOME\AppData\Local\nvim --depth 1 && nvim
```

## Uninstall
```
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# Windows
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```

## 插件自定义
自动更新插件，添加插件，在lua/pluginsConfig/plugins中直接添加即可

## LSP 命令
```
:Lazy - lazy插件管理面板
:Mason - opens a graphical status window
:MasonInstall <package> ... - installs/reinstalls the provided packages
:MasonUninstall <package> ... - uninstalls the provided packages
:MasonUninstallAll - uninstalls all packages
:MasonLog - opens the mason.nvim log file in a new tab window
```
