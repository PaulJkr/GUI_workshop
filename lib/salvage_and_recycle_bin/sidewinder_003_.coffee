# sidewinder_001_
#
{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject} = React.DOM
anchor_000 = require('./lib/anchor_000_.coffee')()
sidewinder = rr


    __inverse__transform: (vec) ->
        math.multiply(math.inv(@props.transform_matrix), vec)
    __transform: (vec) ->
        math.multiply @props.transform_matrix, vec

    tao_000: ->
        [
            {cmd: 'M', vec: [70, 0]}
            {cmd: 'L', vec: [50, 85]}
            {cmd: 'L', vec: [40, 77]}
            {cmd: 'Z', vec: null}
        ]

    tao_to_string: (tao) ->
        tao.reduce (acc, i) =>
            stub = "#{i.cmd}"
            if i.vec?
                stub += "#{i.vec[0]}"
            if i.vec[1] isnt undefined
                stub += "#{i.vec[1]}"
            return acc + stub
        , ""

    componentDidMount: ->
        c 'here'
        # imp = @tao_to_string @tao_000()
        # c 'imp', imp
        # #return {}

    single_vector_to_svg_friendly_string: (vec_2) ->
        "#{vec_2[0]},#{vec_2[1]}"
    bunch_of_vectors_to_svg_friendly_string: (vector_complex) ->
        vector_complex.reduce (acc, i) =>
            acc + " " + @single_vector_to_svg_friendly_string(i)
        , ""

    render: ->

        svg
            width: '100%'
            height: '100%'
            # circle
            #     cx: 10
            #     cy: 10
            #     r: 10










module.exports = -> sidewinder