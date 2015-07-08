# sidewinder_003_
# : working to get the full pipeline running now for svg path elements,
# interfacing to the transform protocol

# todo:  establish shared initial alias for M and iM inverse of M

{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM
anchor_000 = require('./lib/anchor_000_.coffee')()
sidewinder = rr

    cirque: ->
        M = @props.transform_matrix
        cx : 0 + M[0][2]
        cy : 0 + M[1][2]
        r : 40 * M[0][0]

    elliptic: ->
        M = @props.transform_matrix
        cx: 0 + M[0][2]
        cy: 0 + M[1][2]
        rx: 80 * M[0][0]
        ry: 60 * M[0][0]
        #filter: 'url(#dropshadow)'
        fill: 'lightgrey'


    render: ->
        M = @props.transform_matrix
        cirque = @cirque()
        c 'ellipse is', ellipse
        svg
            width: '100%'
            height: '100%'
            defs
                filter
                    id: 'dropshadow'
                    feGaussianBlur
                        in: "SourceAlpha"
                        result: "blurOut"
                        stdDeviation: "4"
                    feOffset
                        in: "blurOut"
                        result: "dropBlur"
                        dx: "5"
                        dy: "5"

            #circle cirque
            ellipse @elliptic()


module.exports = -> sidewinder