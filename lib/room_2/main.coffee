

module.exports = ->
    c = -> console.log.apply console, arguments
    React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a, input} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

    progress_bar = require('./progress_bar_2_.coffee')()
    #range_dial = require('./range_dial.coffee')()

    style = (a) ->
        width: 1000
        height: 600
        background: 'lightblue'

    rr
        
        render: ->
            div
                style: style()
                ,
                progress_bar
                    width: 300
                    height: 30
                div
                    style:
                        position: 'absolute'
                        top: 200
                        left: 20
                    ,
                    progress_bar
                        auto_showoff: on
                        width: 680
                        height: 200
                        backFill: 'black'
                        progressFill: 'magenta'
                # div
                #     style:
                #         position: 'absolute'
                #         top: 400
                #         left: 200
                #     ,
                #     progress_bar
                #         auto_showoff: on
                #         width: 180
                #         height: 20
