{c, React, rr, shortid, assign, update, __react__root__} = require('../../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

anchor = rr
    # todo :: implement this to implement the as-yet-un-named interface which allows components to be displayed in the catalogue cellular striation way.
    getInitialState: ->
        opacity: .4
    render: ->
        if @props.from_hex is on
            c 'say hello'
            svg
                width: '100%'
                height: '100%'
                circle
                    onMouseOver: => @setState
                        opacity: 1
                    onMouseOut: => @setState
                        opacity: .4
                    opacity: 0
                    cx: @props.x
                    cy: @props.y
                    r: 7 * @props.s
                circle
                    onMouseOver: => @setState
                        opacity: 1
                    opacity: 1
                    cx: @props.x
                    cy: @props.y
                    #fill: 'url(#radial__003)'
                    fill: 'black'
                    r: 20# * @props.s
                    onMouseDown: @props.onMouseDown
                    onMouseUp: @props.onMouseUp

        else
            svg
                width: '100%'
                height: '100%'
                circle
                    onMouseOver: => @setState
                        opacity: 1
                    onMouseOut: => @setState
                        opacity: .4
                    opacity: 0
                    cx: @props.cx
                    cy: @props.cy
                    r: 7 * @props.s
                circle
                    onMouseOver: => @setState
                        opacity: 1
                    opacity: @state.opacity
                    cx: @props.cx
                    cy: @props.cy
                    fill: 'url(#radial__003)'
                    r: 2 * @props.s
                    onMouseDown: @props.onMouseDown
                    onMouseUp: @props.onMouseUp

module.exports = -> anchor