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
            {cmd: 'M', vec: [-10, -30]}
            {cmd: 'L', vec: [40, 40]}
            {cmd: 'C', vec: [-20, -30, 20, 30, -40, 70]}
            {cmd: 'A', vec: [20, 30, -45, 0, 1, 10, 15]}
   #         {cmd: 'M', vec: [70, 0]}
    #        {cmd: 'L', vec: [50, 85]}
     #       {cmd: 'L', vec: [40, 77]}
     #       {cmd: 'Z', vec: null}
        ]

    # so now we want to develop a pipeline tool for processing paths
    # in a systematic way that we can scale according to our interface
    # with the usual (homogeneous coordinate matrix transform system)

    transform_Arc_vector: (a_vec) ->

        M = @props.transform_matrix
        # a_vec has size 7
        # the first two args are radii
        # those can be independently scaled

        o_vec = []
        o_vec[0] = a_vec[0] * M[0][0]
        o_vec[1] = a_vec[1] * M[1][1]
        c 'o_vec', o_vec
        o_vec[2] = a_vec[2] # shouldn't need to transform an angle 
        # at this level, but we could do that later if we wanted
        # the flexibility to reorient elements.  in that case we
        # could express the angle in a_vec[2] in terms of a transform 
        # matrix and then multiply it by the provided matrix for 
        # composition.  it looks like it's expressed as a degrees angle
        # xAR = a_vec[2] #x_axis_rotation
        # c 'xAR', xAR
        # theta = math.unit(xAR, 'deg')
        # c 'theta', theta
        # yy = math.cos(theta)
        # c 'yy', yy
        # zz = math.acos(yy)
        # c 'zz', zz
        # aa = zz * (360 / (2 * math.pi))
        # c 'aa', aa
        
        # x_ARM = [[math.cos(theta), math.sin(theta), 0],[-(math.sin(theta)), math.cos(theta), 0],[0,0,1]] #x_axis_rotation_matrix
        # c 'x_ARM'
        # composed_000 = math.multiply(M, x_ARM)
        # cursor_0 = composed_000[0][0]
        # c 'cursor_0', cursor_0
        # xx = math.acos(cursor_0)
        # c 'xx', xx.im * (360 / (2 * math.pi))
        o_vec[3] = a_vec[3] #boolean flag
        o_vec[4] = a_vec[4] # boolean flag
        x = a_vec[5]
        y = a_vec[6]
        cursor_vec = [x, y, 1]
        out_translate_vec = math.multiply M, cursor_vec
        o_vec[5] = out_translate_vec[0]
        o_vec[6] = out_translate_vec[1]
        #c 'o_vec 2', o_vec

        return o_vec




    path_tractor: (tao) ->
        M = @props.transform_matrix
        # right now this takes the already transformed vector values
        # and stringifies them.  we'll need to factor out functions
        # to transform for example the args for arc.
        amp = tao.reduce (acc, i) =>
            # i := {cmd: <string>, vector: <array> or <null>}
            if tao.indexOf(i) is tao.length - 1
                q_space = ""
            else
                q_space = " "
            switch i.cmd
                when 'V'
                    c 'got V'
                    reef = "+"
                when 'H'
                    c 'got H'
                    reef = "+"

                when 'a'
                    c 'got a, vec of size 7 but last two args are relative from point'
                when 'A'
                    c 'got A, this means we get a vector of size 7'
                    pre_vi = i.vec
                    mid_v = @transform_Arc_vector pre_vi
                    vi = mid_v
                    reef = "A #{vi[0]} #{vi[1]} #{vi[2]} #{vi[3]} #{vi[4]} #{vi[5]} #{vi[6]}" + q_space
                when 'S'
                    c 'got big S, for bez curves'
                    reef = "+"
                when 's'
                    c 'got small s, todo implementation'
                    reef = "+"
                when 'T'
                    c 'got T, have to figure something out for stringing together bezier curves'
                    reef = "+"
                when 'C'
                    c 'got C, vecs of size 6'
                    iv = i.vec
                    siv_0 = [iv[0], iv[1], 1]
                    siv_1 = [iv[2], iv[3], 1]
                    siv_2 = [iv[4], iv[5], 1]
                    sov_0 = math.multiply M, siv_0
                    sov_1 = math.multiply M, siv_1
                    sov_2 = math.multiply M, siv_2
                    ov = [sov_0[0], sov_0[1], sov_1[0], sov_1[1], sov_2[0], sov_2[1]]
                    reef = "C #{ov[0]} #{ov[1]} #{ov[2]} #{ov[3]} #{ov[4]} #{ov[5]}"
                when 'M'
                    #pre_v = i.vec
                    vi = i.vec # this will be transformed
                    reef = "M#{vi[0]} #{vi[1]}" + q_space
                when 'Z'
                    reef = "Z" + q_space
                when 'L'
                    vi = i.vec
                    reef = "L#{vi[0]} #{vi[1]}" + q_space
            return acc + reef
        , ""
        return amp

    tao_to_string: (tao) ->
        amp = tao.reduce (acc, i) =>
            stub = "#{i.cmd}"
            if i.vec isnt null
                stub += "#{i.vec[0]} "
                if i.vec[1] isnt undefined
                    stub += "#{i.vec[1]} "
            return acc + stub
        , ""
        return amp

    componentWillMount: ->
        c 'will mount here'
        imp = @path_tractor @tao_000()
        c 'imp', imp

    getInitialState: ->
        c 'getting state here'
        {}


    componentDidMount: ->
        c 'here'
        # imp = @tao_to_string(@tao_000())
        # c 'imp', imp

    single_vector_to_svg_friendly_string: (vec_2) ->
        "#{vec_2[0]},#{vec_2[1]}"
    bunch_of_vectors_to_svg_friendly_string: (vector_complex) ->
        vector_complex.reduce (acc, i) =>
            acc + " " + @single_vector_to_svg_friendly_string(i)
        , ""

    render: ->
        strang = @path_tractor @tao_000()
        c 'strang', strang
        svg
            width: '100%'
            height: '100%'
            path
                d: strang










module.exports = -> sidewinder