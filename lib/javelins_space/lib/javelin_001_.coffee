{c, React, rr, shortid, assign, update, __react__root__} = require('../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

javelin = rr

    render: ->
        rect
            x: @props.x - (5 * @props.scalar_000)
            y: @props.y - (5 * @props.scalar_000)
            width: 10 * @props.scalar_000
            height: 10 * @props.scalar_000
            fill: 'black'

module.exports = -> javelin