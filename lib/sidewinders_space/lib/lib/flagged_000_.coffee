# zero_000 for minesweeper game
# glyph for naval mine for minesweeper game
{c, React, Imm, rr, shortid, keys, assign, update, __react__root__, math} = require('../../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM


hidden = rr

    cirque: ->
        M = @props.transform_matrix
        vector = math.multiply M, [0, 0, 1]
        radius = M[0][0] * 50

        cx: vector[0]
        cy: vector[1]
        r: radius

    render: ->
        svg
            width: '100%'
            height: '100%'
            c_ = @cirque()
            circle
                onContextMenu: (e) =>
                    e.preventDefault()
                    c 'we wonder andare suspicious'
                    @props.toggle_flag @props.index
                onClick: (e) =>
                    c "we wonder"
                cx: c_.cx
                cy: c_.cy
                r: c_.r
                fill: 'green'





module.exports = -> hidden