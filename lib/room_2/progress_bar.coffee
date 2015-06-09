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
        lowerRange: (e) ->
            if @state.range isnt 0
                @setState
                    range: parseInt(@state.range) - 1

        raiseRange: (e) ->
            if @state.range isnt 100
                @setState
                    range: parseInt(@state.range) + 1

        rangeChange: (e) ->
            @setState
                range: e.currentTarget.value

        getInitialState: ->
            whatever: 'yes'
            color_a: 'lightgreen'
            range: 100
        render: ->
            style = (a) ->
                position: 'absolute'

                width: 600
                height: 400
                background: 'lightgrey'
                border: '3px solid white'

                top: 20
                left: 20

            div # conttainer
                style: style()
                ,
                input
                    type: 'range'
                    onChange: @rangeChange
                    value: @state.range
                    step: 1
                    style:
                        position: 'absolute'
                        left: 700
                        width: 200
                    ,
                div
                    onClick: @lowerRange
                    style:
                        zIndex: 700000
                        cursor: 'pointer'
                        position: 'absolute'
                        background: 'lightgrey'
                        border: '1px solid white'
                        padding: 4
                        borderRadius: 10
                        left: 680
                    ,
                    "<-"
                div
                    onClick: @raiseRange
                    style:
                        cursor: 'pointer'
                        position: 'absolute'
                        background: 'lightgrey'
                        border: '1px solid white'
                        padding: 4
                        borderRadius: 10
                        left: 930
                    ,
                    "->"
                div
                    style:
                        position: 'absolute'
                        left: 600
                        top: 100
                        fontSize: 23
                        color: 'white'
                    ,
                    @state.range + "%"
                svg
                    width: 800
                    height: 500
                    style:
                        position: 'absolute'
                    ,
                    defs
                        clipPath
                            id: 'myClip'
                            ,
                            rect
                                x: 48
                                y: 200
                                width: 6 * @state.range
                                height: 400
                    rect
                        x: 100
                        y: 200
                        width: 400
                        height: 100
                        style:
                            fill: 'black'
                    circle
                        cx: 100
                        cy: 250
                        r: 50
                        fill: 'black'
                    circle
                        cx: 500
                        cy: 250
                        r: 50
                        fill: 'black'
                    rect
                        x: 100
                        y: 200
                        width: 402
                        height: 102
                        clipPath: 'url(#myClip)'
                        style:
                            fill: @state.color_a or 'darkgrey'
                    circle
                        cx: 100
                        cy: 250
                        r: 52
                        clipPath: 'url(#myClip)'
                        fill: @state.color_a or 'darkgrey'
                    circle
                        cx: 500
                        cy: 250
                        r: 52
                        clipPath: 'url(#myClip)'
                        fill: @state.color_a



