module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 13,
    fontWeight: 300,

    // font family with optional fallbacks
    fontFamily: 'Source Code Pro, monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(255, 255, 255, 0.75)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    backgroundColor: '#141820',

    // border color (window, tabs)
    borderColor: '#202633',

    // custom css to embed in the main window
    css: '',

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // https://coolors.co/e04d69-e0a24c-65759b-8ecde2-141820
    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: '#E04D69',
      green: '#656F9B',
      yellow: '#E0A24C',
      blue: '#656F9B',
      magenta: '#E04D69',
      cyan: '#8ECDE2',
      white: '#E0E0E0',
      lightBlack: '#000000',
      lightRed: '#E04D69',
      lightGreen: '#656F9B',
      lightYellow: '#E0A24C',
      lightBlue: '#656F9B',
      lightMagenta: '#E04D69',
      lightCyan: '#8ECDE2',
      lightWhite: '#ffffff'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: '/usr/local/bin/zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyperterm.org/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyperlinks',
    'hyper-statusline',
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
