require('nvim-web-devicons').setup({
  default = true;
  strict = true;
  override = {
    default = {
      icon = "󰈚",
      name = "Default",
    },
    c = {
      icon = "",
      color = '#ffffff',
      name = "c",
    },

    cpp = {
      icon = '',
      color = '#89b4fa',
      name = 'cpp',
    },

    css = {
      icon = "",
      color = '#89b4fa',
      name = "css",
    },

    dart = {
      icon = "",
      color = '#74c7ec',
      name = "dart",
    },

    deb = {
      icon = "",
      name = "deb",
    },

    Dockerfile = {
      icon = "",
      name = "Dockerfile",
    },

    eslint = {
      icon = '󰱺',
      color = '#443b59',
      name = 'eslint',
    },

    html = {
      icon = "",
      color = '#fab387',
      name = "html",
    },

    jpeg = {
      icon = "󰉏",
      name = "jpeg",
    },

    jpg = {
      icon = "󰉏",
      name = "jpg",
    },

    cjs = {
      icon = "󰌞",
      color = '#f9e2af',
      name = "js",
    },

    js = {
      icon = "󰌞",
      color = '#f9e2af',
      name = "js",
    },

    jsx = {
      icon = '',
      color = '#f9e2af',
      name = 'jsx',
    },

    kt = {
      icon = "󱈙",
      name = "kt"
    },
    lock = {

      icon = "󰌾",
      name = "lock",
    },

    lua = {
      icon = "",
      color = '#89b4fa',
      name = "lua",
    },

    mp3 = {
      icon = "󰎆",
      name = "mp3",
    },

    mp4 = {
      icon = "",
      name = "mp4",
    },

    out = {
      icon = "",
      name = "out",
    },

    png = {
      icon = "󰉏",
      name = "png",
    },

    py = {
      icon = "",
      color = '#89b4fa',
      name = "py",
    },

    ["robots.txt"] = {
      icon = "󰚩",
      name = "robots",
    },

    toml = {
      icon = "",
      name = "toml",
    },

    ts = {
      icon = "󰛦",
      color = '#89b4fa',
      name = "ts",
    },
    tsx = {
      icon = '',
      color = '#89b4fa',
      name = "tsx",
    },

    ttf = {
      icon = "",
      name = "TrueTypeFont",
    },

    rb = {
      icon = "",
      name = "rb",
    },

    rpm = {
      icon = "",
      name = "rpm",
    },

    vue = {
      icon = "󰡄",
      name = "vue",
    },

    woff = {
      icon = "",
      name = "WebOpenFontFormat",
    },

    woff2 = {
      icon = "",
      name = "WebOpenFontFormat2",
    },

    xz = {
      icon = "",
      name = "xz",
    },

    zip = {
      icon = "",
      name = "zip",
    },
  },

  override_by_filename = {
    ['package.json'] = {
      icon = '󰎙',
      color = '#8cca4f',
      name = 'package.json',
    },
    ['.eslintrc.cjs'] = {
      icon = '󰱺',
      color = '#443b59',
      name = 'eslint'
    },
    ['.eslintrc.js'] = {
      icon = '󰱺',
      color = '#443b59',
      name = 'eslint'
    },
    ['.prettierrc'] = {
      icon = '󰬗',
      color = '#f38ba8',
      name = 'prettierrc'
    },
    ['.prettierignore'] = {
      icon = '󰬗',
      color = '#7f849c',
      name = 'prettierrc'
    },
    ['pnpm-lock.yaml'] = {
      icon = '',
      color = '#fab387',
      name = '',
    },
    ['pnpm-workspace.yaml'] = {
      icon = '',
      color = '#fab387',
      name = '',
    },
    ['vite.config.js'] = {
      icon = '󱐌',
      color = '#cba6f7',
      name = 'vite_config_js'
    },
    ['vite.config.ts'] = {
      icon = '󱐌',
      color = '#cba6f7',
      name = 'vite_config_ts'
    }
  },
})
