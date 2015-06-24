

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
    #entry: [__dirname + '/organ_tree_editor.coffee']
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
            # {
            #     test: /\.css$/
            #     loader: ETP.extract("css-loader")
            # },
            {
                test: /\.coffee$/
                loaders: ['react-hot', 'coffee-loader', 'source-map-loader']
            }
        ]
    # plugins: [
    #     new ETP("styles.css")
    # ]
    output:
        path: __dirname
        #publicPath: "/assets/"
        filename: "gui_workshop__packed.js"
        #library: "ote_box"



