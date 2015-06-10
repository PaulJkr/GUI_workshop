

module.exports = ->
    c = -> console.log.apply console, arguments
    React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, defs, linearGradient, circle, stop, ul, li, ol, code, a, input} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

    progress_bar = require('./progress_bar_2_.coffee')()
    progress_bar_3 = require('./progress_bar_3_.coffee')()
    #range_dial = require('./range_dial.coffee')()

    style = (a) ->
        width: 1000
        height: 600
        background: 'lightblue'

    rr
        render: ->
            svg null,
                defs
                    linearGradient
                        id: "grad1"
                        x1: "0%"
                        y1: "0%"
                        x2: "100%"
                        y2: "100%"
                        stop
                            offset: "0%"
                            style: "stop-color:rgb(255,255,0);stop-opacity:1"
                        stop
                            offset: "100%"
                            style: "stop-color:rgb(255,0,0);stop-opacity:1"
            div
                style: style()
                ,
                progress_bar_3
                    auto_showoff: on
                    width: 400
                    height: 30
                div
                    style:
                        position: 'absolute'
                        top: 200
                        left: 20
                    ,
                    progress_bar_3
                        auto_showoff: off
                        width: 400
                        height: 50
                        backFill: 'black'
                        #progressFill: #'magenta'
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
