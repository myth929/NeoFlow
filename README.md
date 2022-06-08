# 自用neovim config

## 目录结构
```
$ tree ~/.config/nvim
.
├── ftplugin                      -- 目录，存放不同文件类型的差异化配置文件
├── snippets                      -- 目录，存放用户自定义的代码片段文件
├── lua                           -- 目录，neovim 配置主目录
│   ├── configure                 -- 目录，neovim 主配置目录
│   │   ├── dap                   -- 目录，存放 DAP 配置文件
│   │   ├── lsp                   -- 目录，存放 LSP 配置文件
│   │   ├── plugins               -- 目录，存放各个插件的配置文件
│   │   └── theme                 -- 目录，存放主题插件的定制化高亮文件
│   ├── core                      -- 目录，neovim 核心配置存放目录
│   │   ├── after                 -- 目录，存放辅助性功能运行文件
│   │   │   └── init.lua          -- 文件，after 模块的入口文件
│   │   ├── mapping.lua           -- 文件，用户自定制按键映射配置文件
│   │   ├── options.lua           -- 文件，用户自定制个性化配置文件
│   │   ├── plugins.lua           -- 文件，项目依赖插件主配置文件
│   │   └── setting.lua           -- 文件，neovim 预设配置文件
│   └── utils                     -- 目录，存放项目公用辅助性功能文件
│       ├── api                   -- 目录，存放用户自定义功能性函数文件
│       └── icons.lua             -- 文件，存放用户自定义图标
└── init.lua                      -- 文件，neovim 配置入口文件
```

## 插件下载、更新、删除插件
`:PackerSync`