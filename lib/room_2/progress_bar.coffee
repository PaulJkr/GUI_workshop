module.exports = ->
    c = -> console.log.apply console, arguments
    React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

    abs_pos = (a) ->
        position: 'absolute'
        width: a.w or 100
        height: a.h or 100
        top: a.t or ''
        left: a.l or ''
        bottom: a.b or ''
        right: a.r or ''
        zIndex: 500


    style_alpha_position = (a) ->
        color: 'white'





    rr
        getInitialState: ->
            whatever: 'yes'
            color_a: 'lightgreen'
        render: ->
            style = (a) ->
                position: 'absolute'
                zIndex: 70000
                width: 300
                height: 300
                background: 'lightgrey'
                border: '3px solid white'
                borderRadius: 300
                top: 200
                left: 300

            div # conttainer
                style: style()
                ,
                div
                    style: #abs_pos
                        position: 'absolute'
                        top: 10
                        left: 10

                    ,
                    'yes'
                svg
                    width: 400
                    height: 400

                    ,
                    defs
                        clipPath
                            id: 'myClip'
                            ,
                            rect
                                x1: 100
                                y1: 0
                                x2: 100
                                y2: 200

                    rect
                        x: 50
                        y: 100
                        width: 400
                        height: 100
                        #clipPath: 'url(#myClip)'
                        style:
                            fill: 'darkgrey'
                    circle
                        cx: 50
                        cy: 150
                        r: 50
                        fill: @state.color_a or 'darkgrey'

