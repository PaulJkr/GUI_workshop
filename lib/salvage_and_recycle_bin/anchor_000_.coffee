{c, React, rr, shortid, keys, assign, update, __react__root__} = require('../../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

anchor = rr
    # todo :: implement this to implement the as-yet-un-named interface which allows components to be displayed in the catalogue cellular striation way.
    testMe: ->
        c "cool cool the refs is  working"
    componentDidMount: ->
        @toggle_warble on

    getInitialState: ->
        opacity: .4

    toggle_warble: (a) ->
        if a is off
            clearInterval @warble
        if a is on
            start_warble = new Date().getTime()
            @warble = setInterval =>
                now = new Date().getTime()
                delta = now - start_warble
                cursor = delta % 1800
                if cursor < 900
                    @setState
                        opacity: cursor / 1000
                else
                    @setState
                        opacity: (1800 - cursor) / 1000

                # @setState
                #     opacity: ((delta % 1000) / 1000)
            , 20

    render: ->
        svg
            width: '100%'
            height: '100%'
            circle
                onMouseOver: =>
                    @toggle_warble off
                    @setState
                        opacity: 1
                onMouseOut: =>
                    @toggle_warble on
                    @setState
                        opacity: .4
                opacity: 0
                cx: @props.cx
                cy: @props.cy
                r: 7 * @props.s
            circle
                onMouseOver: =>
                    @toggle_warble off
                    @setState
                        opacity: 1
                opacity: @state.opacity
                cx: @props.cx
                cy: @props.cy
                fill: 'url(#radial__003)'
                r: 2 * @props.s
                onMouseDown: @props.onMouseDown
                onMouseUp: @props.onMouseUp

module.exports = -> anchor