# sidewinder_003_
# : working to get the full pipeline running now for svg path elements,
# interfacing to the transform protocol

# todo:  establish shared initial alias for M and iM inverse of M

{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM
anchor_000 = require('./lib/anchor_000_.coffee')()
sidewinder = rr

    clicked: (e) ->
        @props.action?()
        @setState
            fill: 'lightgreen'
        setTimeout =>
            @setState
                fill: 'lightgrey'
        , 300

    getInitialState: ->
        fill: 'lightgrey'

    cirque: ->
        M = @props.transform_matrix
        cx : 0 + M[0][2]
        cy : 0 + M[1][2]
        r : 40 * M[0][0]

    textic: ->
        M = @props.transform_matrix

        origin = [0, 0, 1]
        transformed_origin = math.multiply M, origin
        scale = M[0][0]
        width = 40 * M[0][0]
        height = 30 * M[0][0]

        fontSize: 38 * scale
        x: transformed_origin[0] - (width * 1.1 )
        y: transformed_origin[1] + (height * .3 )
        width: width
        height: height
        onClick: @clicked

    elliptic: ->
        M = @props.transform_matrix

        cx: 0 + M[0][2]
        cy: 0 + M[1][2]
        rx: 80 * M[0][0]
        ry: 60 * M[0][0]
        #filter: 'url(#disabled)'
        fill: @state.fill
        onClick: @clicked


    render: ->

        M = @props.transform_matrix
        #cirque = @cirque()
        svg
            width: '100%'
            height: '100%'
            defs
                filter
                    id: 'disabled'
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
            text @textic(), (@props.action_name or 'helo')


module.exports = -> sidewinder