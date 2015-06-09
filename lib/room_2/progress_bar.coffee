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

        rangeChange: (e) ->
            c 'current target val', e.currentTarget.value
            @setState
                range: e.currentTarget.value

        getInitialState: ->
            whatever: 'yes'
            color_a: 'lightgreen'
            range: 100
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
                input
                    type: 'range'
                    onChange: @rangeChange
                    defaultValue: 100
                    min: 1
                    step: 1
                    style:
                        position: 'absolute'
                        left: 300
                    ,
                div
                    style:
                        position: 'absolute'
                        left: 600
                        top: 100
                        fontSize: 23
                        color: 'white'
                    ,
                    "" + (@state.range)
                svg
                    width: 400
                    height: 400

                    ,
                    defs
                        clipPath
                            id: 'myClip'
                            ,
                            rect
                                x: 0
                                y: 100
                                width: 4 * (@state.range or 100)
                                height: 400

                    rect
                        x: 50
                        y: 100
                        width: 400
                        height: 100
                        clipPath: 'url(#myClip)'
                        style:
                            fill: 'darkgrey'
                    circle
                        cx: 50
                        cy: 150
                        r: 50
                        clipPath: 'url(#myClip)'
                        fill: @state.color_a or 'darkgrey'

