{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

anchor = rr

    cirque: ->
        M = @props.transform_matrix
        origin = [0, 0, 1]

        mapped = math.multiply M, origin

        return mapped


    render: ->

        cirque = @cirque()
        r = @props.transform_matrix[0][0] * 80


        svg
            width: '100%'
            height: '100%'
            ,
            circle
                onClick: => if @props.from_hex is on then @props.set_content_vector(@props.section, @props.cell) else return null
                cx: cirque[0]
                cy: cirque[1]
                r: r
                fill: 'blue'
                opacity: .38
                onMouseDown: @props.onMouseDown
                onMouseUp: @props.onMouseUp




module.exports = -> anchor