{c, React, rr, shortid, assign, update, __react__root__} = require('../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

javelin = rr

    render: ->
        c 'have jav_001 with', @props
        s = @props.scalar_000
        c 's', s
        rect
            x: @props.x - (20 * s)
            y: @props.y - (20 * s)
            width: (40 * s)
            height: (40 * s)
            fill: 'black'
            onClick: => @props.set_content_vector(@props.section, @props.cursor)

module.exports = -> javelin