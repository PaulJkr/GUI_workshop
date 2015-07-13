# webpack config
webpack = require 'webpack'
c = -> console.log.apply console, arguments
path = require 'path'

module.exports = config =
    worker:
        output:
            filename: "hash.worker.js"
            chunkFilename: "[id].hash.worker.js"
    node:
        fs: "empty"
    context: __dirname
    cache: true
    debug: true
    entry:
        app: ['webpack/hot/dev-server', './gui_workshop_new.coffee']
    stats:
        colors: on
        reasons: on
    module:
        loaders: [
            {
                test: /\.styl$/
                loader: 'style-loader!css-loader!stylus-loader'
            },
            {
                test: /\.coffee$/
                loaders: ['react-hot', 'coffee-loader', 'source-map-loader']
            }
        ]
    output:
        path: __dirname
        filename: "gui_workshop__packed.js"




