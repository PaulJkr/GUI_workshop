# anchor_000_
#
{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM
anchor = rr
    componentDidMount: ->
        @toggle_warble on
    toggle_warble: (a) ->
        if a is off
            clearInterval @warble
        if a is on
            start_warble = new Date().getTime()
            @warble = setInterval =>
                now = new Date().getTime()
                delta = now - start_warble
                headstart = 960
                cursor = (delta + headstart) % 1800
                if cursor < 900
                    @setState
                        opacity: cursor / 1000
                else
                    @setState
                        opacity: (1800 - cursor) / 1000
            , 20
    getInitialState: ->
        opacity: .4
        color: Math.random() * 360
        offset_1: 10
        offset_2: 40
        offset_3: 180
    cirque: ->
        math.multiply @props.transform_matrix, [0, 0, 1]
    render: ->
        cirque = @cirque()
        r = @props.transform_matrix[0][0] * 120
        svg
            width: '100%'
            height: '100%'
            ,
            defs
                radialGradient
                    id: 'radial__003'
                    ,
                    stop
                        offset: @state.offset_1 + "%"
                        stopColor: "hsl(#{(@state.color + 240) % 360},99%,80%)"
                    stop
                        offset: @state.offset_2 + "%"
                        stopColor: "hsl(#{(@state.color + 120) % 360},99%,81%)"
                    stop
                        offset: @state.offset_3 + "%"
                        stopColor: "hsl(#{@state.color},99%,70%)"
            circle
                onMouseOver: =>
                    @toggle_warble off
                    @setState
                        opacity: 1
                onMouseOut: =>
                    @toggle_warble on
                opacity: 0
                cx: cirque[0]
                cy: cirque[1]
                r: 2.4 * r
            circle
                onClick: => if @props.from_hex is on then @props.set_content_vector(@props.section, @props.cell) else return null
                cx: cirque[0]
                cy: cirque[1]
                r: r
                fill: 'url(#radial__003)'
                opacity: @state.opacity
                onMouseOver: =>
                    @toggle_warble off
                    @setState
                        opacity: 1
                onMouseDown: @props.onMouseDown
                onMouseUp: @props.onMouseUp




module.exports = -> anchor