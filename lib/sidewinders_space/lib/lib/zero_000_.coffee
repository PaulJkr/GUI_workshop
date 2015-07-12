# zero_000 for minesweeper game
# glyph for naval mine for minesweeper game
{c, React, Imm, rr, shortid, keys, assign, update, __react__root__, math} = require('../../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM


zero = rr
    componentWillMount: ->
        @M = @props.transform_matrix

    tex: ->
        vector = math.multiply @M, [0, 0, 1]
        x: vector[0]
        y: vector[1]
        fontSize: 80 * @M[0][0]

    render: ->
        svg
            width: '100%'
            height: '100%'
            t_ = @tex()
            text
                # width: 30
                # height: 30
                x: t_.x
                y: t_.y
                fontSize: t_.fontSize
                "0"





module.exports = -> zero