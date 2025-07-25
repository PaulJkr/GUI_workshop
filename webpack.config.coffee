# webpack.config.coffee

webpack = require 'webpack'
MiniCssExtractPlugin = require 'mini-css-extract-plugin'
path = require 'path'

module.exports = config =
  mode: 'development'
  context: __dirname
  cache: true

  entry:
    app: ['webpack/hot/dev-server', './gui_workshop_new.coffee']

  output:
    path: __dirname
    filename: 'gui_workshop__packed.js'

  module:
    rules: [

      # CSS/STYLUS
      {
        test: /\.styl$/
        use: [
          MiniCssExtractPlugin.loader
          'css-loader'
          'stylus-loader'
        ]
      }

      # COFFEESCRIPT
      {
        test: /\.coffee$/
        use: [
          'coffee-loader'
          'source-map-loader'
        ]
      }

      # OPTIONAL: JSX/Babel (in case some .js files use JSX or modern syntax)
      {
        test: /\.jsx?$/
        exclude: /node_modules/
        use:
          loader: 'babel-loader'
          options:
            presets: ['@babel/preset-env', '@babel/preset-react']
      }

      # WEB WORKERS
      {
        test: /\.worker\.js$/
        use:
          loader: 'worker-loader'
      }
    ]

  plugins: [
    new webpack.HotModuleReplacementPlugin()
    new MiniCssExtractPlugin
      filename: 'styles.css'
  ]

  resolve:
    extensions: ['.js', '.jsx', '.coffee', '.styl', '.worker.js']
    fallback:
      fs: false
      path: require.resolve('path-browserify')
      crypto: false

  devtool: 'source-map'

  stats:
    colors: true
    reasons: true
