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

                #width: 600
                #height: 500
                #background: 'lightgrey'
                #border: '3px solid white'

                #top: 20
                #left: 20
            height = @props.height
            width = @props.width
            c 'height and width', height, width
            padX = 8
            padY = 8

            div # container
                style: style()
                ,
                input
                    type: 'range'
                    onChange: @rangeChange
                    value: @state.range
                    step: 1
                    style:
                        position: 'absolute'
                        left: @props.width + 300

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
                    width: 600
                    height: 500
                    style:
                        background: 'lightgrey'
                        position: 'absolute'
                    ,
                    defs
                        clipPath
                            id: 'myClip'
                            ,
                            rect
                                x: 0
                                y: 0
                                width: ((width / 100) + padX) * @state.range
                                height: height + 10 # fix this
                    rect
                        x: (height / 2) + padX
                        y: padY / 2
                        width: width - height
                        height: height
                        style:
                            fill: 'red'
                    circle #left circle bound ; could make an ellipse for other styles
                        cx: (height / 2) + (padX / 2)
                        cy: (height / 2) + (padY / 2)
                        r: (height / 2)
                        fill: 'black'
                    circle # right circle bound
                        cx: width - (height / 2) + padX
                        cy: (height / 2) + (padY / 2)
                        r: height / 2
                        fill: 'black'
                    rect
                        x: (height / 2) + padX
                        y: 0
                        width: width - height
                        height: height + padY
                        clipPath: 'url(#myClip)'
                        style:
                            fill: @state.color_a or 'darkgrey'
                    circle
                        cx: (height / 2) + (padX / 2)
                        cy: (height / 2) + (padY / 2)
                        r: (height / 2) + (padY / 2)
                        clipPath: 'url(#myClip)'
                        fill: @state.color_a or 'darkgrey'
                    circle
                        cx: width - (height / 2) + (padX)
                        cy: (height / 2) + (padY / 2)
                        r: (height / 2) + (padY / 2)
                        clipPath: 'url(#myClip)'
                        fill: @state.color_a



