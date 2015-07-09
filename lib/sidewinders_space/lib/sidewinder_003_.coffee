# sidewinder_003_
# : working to get the full pipeline running now for svg path elements,
# interfacing to the transform protocol

# todo:  establish shared initial alias for M and iM inverse of M

{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text} = React.DOM
anchor_000 = require('./lib/anchor_000_.coffee')()

button_000 = require('./sidewinder_004_.coffee')()


control_panel = rr

    render: ->
        {tao_001, smallest, strang_1} = @props
        svg
            width: '100%'
            height: '100%'
            for i, idx in tao_001
                for j, idx1 in i.vec_z_b
                    do (j, idx1) =>
                        foreignObject
                            x: strang_1[0]
                            y: (100 * idx) + (30 * idx1) + "px"
                            width: smallest * 96 + "px"
                            height: '100%'
                            span
                                style: null
                                "#{i.cmd}, #{j}"
                            input
                                type: 'number'
                                value: @props.state[j]
                                style:
                                    color: 'red'
                                    fontSize: smallest * 5 + "px"
                                    background: 'transparent'
                                    border: 'none'
                                onChange: (e) =>
                                    @props.changeVal(j, e.currentTarget.value)
                                    # @setState
                                    #     "#{j}": parseInt(e.currentTarget.value)

sidewinder = rr

    __inverse__transform: (vec) ->
        math.multiply(math.inv(@props.transform_matrix), vec)
    __transform: (vec) ->
        math.multiply @props.transform_matrix, vec

    tao_000: ->
        [
            {cmd: 'M', vec: [-10, -@state.x]}
            {cmd: 'L', vec: [40, 40]}
            {cmd: 'C', vec: [-(@state.x1), -30, 20, 30, -40, 70]}
            {cmd: 'c', vec: [-25, -34, 22, 34, -40, 70]}
     #       {cmd: 'A', vec: [20, 30, -45, 0, 1, 10, 15]}
   #         {cmd: 'M', vec: [70, 0]}
    #        {cmd: 'L', vec: [50, 85]}
     #       {cmd: 'L', vec: [40, 77]}
     #       {cmd: 'Z', vec: null}
        ]

    tao_001: ->
        populated = for i, idx in @state.command_b
            pop_vector = for j, idx1 in i.vec_z_b
                @state[j]
            {cmd: i.cmd, vec: pop_vector, vec_z_b: i.vec_z_b}
        return populated

    # so now we want to develop a pipeline tool for processing paths
    # in a systematic way that we can scale according to our interface
    # with the usual (homogeneous coordinate matrix transform system)

    transform_Move_vector: (a_vec) ->
        iv = [a_vec[0], a_vec[1], 1]
        M = math.matrix @props.transform_matrix
        ov = math.multiply M, iv
        return ov._data

    transform_move_vector: (a_vec) ->
        M = math.matrix @props.transform_matrix
        M._data[0][2] = 0
        M._data[1][2] = 0
        iv = [a_vec[0], a_vec[1], 1]
        ov = math.muliply M, iv
        return ov._data

    transform_arc_vector: (a_vec) ->
        M = @props.transform_matrix
        o_vec = []
        o_vec[0] = a_vec[0] * M[0][0]
        o_vec[1] = a_vec[1] * M[1][1]
        o_vec[2] = a_vec[2] # shouldn't need to transform an angle 
        o_vec[3] = a_vec[3] #boolean flag
        o_vec[4] = a_vec[4] # boolean flag
        x = a_vec[5]
        y = a_vec[6]
        cursor_vec = [x, y, 1]
        out_translate_vec = math.multiply M, cursor_vec
        o_vec[5] = out_translate_vec[0]
        o_vec[6] = out_translate_vec[1]
        return o_vec

    transform_Curve_vector: (a_vec) ->
        M = @props.transform_matrix # move this to this.M = __ ...?
        iv = a_vec
        siv_0 = [iv[0], iv[1], 1]
        siv_1 = [iv[2], iv[3], 1]
        siv_2 = [iv[4], iv[5], 1]
        sov_0 = math.multiply M, siv_0
        sov_1 = math.multiply M, siv_1
        sov_2 = math.multiply M, siv_2
        ov = [sov_0[0], sov_0[1], sov_1[0], sov_1[1], sov_2[0], sov_2[1]]
        return ov

    transform_curve_vector: (a_vec) ->
        M = math.matrix @props.rectangle_transform_matrix
        M_alt = math.matrix M
        M_alt._data[0][2] = 0
        M_alt._data[1][2] = 0
        iv = a_vec
        siv_0 = [iv[0], iv[1], 1]
        siv_1 = [iv[2], iv[3], 1]
        siv_2 = [iv[4], iv[5], 1]
        sov_0 = math.multiply M_alt, siv_0
        sov_1 = math.multiply M_alt, siv_1
        sov_2 = math.multiply M_alt, siv_2
        ov = [sov_0[0], sov_0[1], sov_1[0], sov_1[1], sov_2[0], sov_2[1]]
        return ov

    path_tractor: (tao) ->
        M = @props.transform_matrix

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

                when 'a', 'A'
                    ov = @transform_arc_vector i.vec
                    reef = "#{i.cmd} #{ov[0]} #{ov[1]} #{ov[2]} #{ov[3]} #{ov[4]} #{ov[5]} #{ov[6]}" + q_space
                # when 'A'
                #     ov = @transform_arc_vector i.vec
                #     reef = "A #{ov[0]} #{ov[1]} #{ov[2]} #{ov[3]} #{ov[4]} #{ov[5]} #{ov[6]}" + q_space
                when 'S'
                    c 'got big S, for bez curves'
                    reef = "+"
                when 's'
                    c 'got small s, todo implementation'
                    reef = "+"
                when 'T'
                    c 'got T, have to figure something out for stringing together bezier curves'
                    reef = "+"
                when 'C', 'c'
                    ov = if i.cmd is 'c'
                        @transform_curve_vector i.vec
                    else
                        @transform_Curve_vector i.vec
                    reef = "#{i.cmd} #{ov[0]} #{ov[1]} #{ov[2]} #{ov[3]} #{ov[4]} #{ov[5]}"
                when 'M', 'm'
                    ov = if i.cmd is 'm'
                        @transform_move_vector i.vec
                    else
                        @transform_Move_vector i.vec
                    reef = "M#{ov[0]} #{ov[1]}" + q_space
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

    getInitialState: ->

        tao_000_start_bundle = [
            {cmd: 'M', vec: [-10, -30]}
            {cmd: 'L', vec: [40, 30]}
            {cmd: 'C', vec: [-38, -30, 20, 30, -40, 70]}
            {cmd: 'c', vec: [-25, -34, 22, 34, -40, 70]}
        ]
        basket = {}
        command_b = for cmd, idx in tao_000_start_bundle
            cmd_z = shortid.generate()
            vec_z_b = []
            for scalar, idx1 in cmd.vec
                scalar_z = shortid.generate()
                vec_z_b.push scalar_z
                assign basket, "#{scalar_z}": scalar
            # now we want to return something like
            {cmd: cmd.cmd, vec_z_b: vec_z_b} #maybe also a key to index them and attach them to a particular path's d complex



        to_return =
            tao_000_start_bundle: tao_000_start_bundle
            x: 40
            x1: 38
        assign to_return, basket
        assign to_return, command_b: command_b
        c 'to_return', to_return
        return to_return


    componentDidMount: ->
        c 'here'
        # imp = @tao_to_string(@tao_000())
        # c 'imp', imp
        # test = shortid.generate()
        # @setState
        #     "#{test}": "hello good"
        # setTimeout =>
        #     c "testing for hello good", @state[test]
        # , 1000

    single_vector_to_svg_friendly_string: (vec_2) ->
        "#{vec_2[0]},#{vec_2[1]}"
    bunch_of_vectors_to_svg_friendly_string: (vector_complex) ->
        vector_complex.reduce (acc, i) =>
            acc + " " + @single_vector_to_svg_friendly_string(i)
        , ""
    changeVal: (j, val) ->
        @setState
            "#{j}": parseFloat val
    render: ->
        rM = @props.rectangle_transform_matrix
        
        M = @props.transform_matrix
        tao_001 = @tao_001()
        strang = @path_tractor @tao_001()

        strang_1 = math.multiply rM, [70, -70, 1]
        strang_2 = math.multiply rM, [70, 30, 1]
        smallest = if rM[0][0] < math.abs(rM[1][1])
            rM[0][0]
        else
            math.abs(rM[1][1])
        svg
            width: '100%'
            height: '100%'
            path
                d: strang
            button_transform = [[.13, 0, 40],[0,.13, -40],[0, 0, 1]]
            button_transform_2 = math.multiply M, button_transform
            button_000
                transform_matrix: button_transform_2
                action_name: "+cmd"
            if @props.from_root is on
                control_panel
                    tao_001: tao_001
                    state: @state
                    smallest: smallest
                    strang_1: strang_1
                    changeVal: @changeVal


















module.exports = -> sidewinder