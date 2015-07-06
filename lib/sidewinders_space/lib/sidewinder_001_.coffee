{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

anchor = require('./lib/anchor_000_.coffee')()

sidewinder = rr

    cirque: ->
        c 'math', math.multiply
        transform_matrix = @props.transform_matrix
        c "props.transform_matrix", transform_matrix
        
        vec_000 = [0, 0, 1]
        vec_001 = math.multiply(transform_matrix, vec_000)

        r = transform_matrix[0][0] * 50

        cx: vec_001[0]
        cy: vec_001[1]
        r: r



    render: ->

        {cx, cy, r} = @cirque()
        circle
            cx: cx
            cy: cy
            r: r
            fill: 'blue'


module.exports = -> sidewinder