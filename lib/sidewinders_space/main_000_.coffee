{c, React, rr, shortid, assign, keys, update, __react__root__, math} = require('../__boiler__plate__.coffee')()
{alert, prompt, p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM
# { here import some components , for doing like adhoc controllers, stuff like custom sliders , that stuff could be in lib root or something.}
require_dyn = require.context('./lib', true, /.coffee$/)
basket_sidewinders = require_dyn.keys().reduce (acc, i) ->
    acc[i] = require_dyn(i)()
    acc
, {}

hexagon_cell = rr

    hexagon_001: ->  # there should be a class for 2-vecs
        # array of 2-vec points ; this more compatible with mathjs
        [
            [-49.5 , 99, 1]
            [49.5, 99, 1]
            [99, 0, 1]
            [49.5, -99, 1]
            [-49.5, -99, 1]
            [-99, 0, 1]
        ]

    hexagon_002: ->  # there should be a class for 2-vecs
        # array of 2-vec points ; this more compatible with mathjs
        z = 85
        [
            [-z , z/2, 1]
            [0, z, 1]
            [z, z/2, 1]
            [z, -z/2, 1]
            [0, -z, 1]
            [-z, -z/2, 1]
        ]

    single_vector_to_svg_friendly_string: (vec_2) ->
        "#{vec_2[0]},#{vec_2[1]}"

    bunch_of_vectors_to_svg_friendly_string: (vector_complex) ->
        strang = vector_complex.reduce (acc, i) =>
            acc + " " + @single_vector_to_svg_friendly_string(i)
        , ""
        c 'strang', strang
        return strang

    transform_constellation: ->
        hex_map = @hexagon_002()
        M = @props.transform_matrix
        constell = for vec, idx in hex_map
            math.multiply(M, vec)
        return constell # shouldn't need this, might not even need the constell =

    render: ->
        polygon
            stroke: 'black'
            fill: @props.color or 'lightgrey'
            points: @bunch_of_vectors_to_svg_friendly_string(@transform_constellation())


sidewinders_space = rr

    getInitialState: ->
        vW = @props.view_width ; vH = @props.view_height
        if vW <= vH then smaller = vW else smaller = vH
        scale_factor: 200 / smaller
        hex_size: 50

    translation_vector: (j, i) ->
        hex_size = @state.hex_size
        x : if j % 2 is 0 then ((i * hex_size) + (hex_size * .5)) else ((i * (hex_size)) + (hex_size))
        y : (j * (hex_size * .75)) + (hex_size * .5)

    translation_matrix: (j, i) ->
        M = []
        M[0] = [1, 0, @translation_vector(j, i).x]
        M[1] = [0, 1, @translation_vector(j, i).y]
        M[2] = [0, 0, 1]
        return M

    scale_matrix: ->
        scale_factor = @state.scale_factor
        M = []
        M[0] = [scale_factor, 0, 0]
        M[1] = [0, scale_factor, 0]
        M[2] = [0, 0, 1]
        return M

    transform_matrix: (j, i) ->
        M = math.multiply @translation_matrix(j, i), @scale_matrix()
        return M

    # matrix_multiply: (M_1, M_2) ->
    #     for i, idx in M_1


    render: ->
        {scale_factor, hex_size} = @state ; vW = @props.view_width ; vH = @props.view_height
        column_cardinality = Math.floor(vW / (hex_size)) ; row_cardinality = 1 + Math.floor((vH - (hex_size)) / (hex_size * .75))

        keys__ = Object.keys basket_sidewinders
        div
            style:
                position: 'absolute'
                width: '100%'
                height: '100%'
                background: 'white'
            ,
            svg
                width: '100%'
                height: '100%'
                ,
                # hexagon_cell
                #     transform_matrix: @transform_matrix(1, 1)
                for j in [0 .. (row_cardinality - 1)]
                    if (j % 2) is 0 then limit_x = (column_cardinality - 1) else limit_x = (column_cardinality - 2)
                    for i in [0 .. (limit_x)]
                        #cursor = keys__.pop()
                        #elk = basket_sidewinders[cursor]
                        hexagon_cell
                            transform_matrix: @transform_matrix(j, i)


module.exports = -> sidewinders_space
