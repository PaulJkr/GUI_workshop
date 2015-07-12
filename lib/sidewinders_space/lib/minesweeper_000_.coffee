# minesweeper_000_
{c, React, Imm, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM

anchor_000 = require('./lib/anchor_000_.coffee')()


mine_000 = require('./mine_000_.coffee')()

zero_000 = require('./lib/zero_000_.coffee')()
one_000 = require('./lib/one_000_.coffee')()
two_000 = require('./lib/two_000_.coffee')()
three_000 = require('./lib/three_000_.coffee')()
four_000 = require('./lib/four_000_.coffee')()


minesweeper = rr
    componentWillMount: ->
        @M = @props.square_transform_matrix

    main_board_000: ->
        c "@M", @M
        i_origin = [-90, 90, 1] # ideal origin
        i_span = 180 # ideal span
        t_origin = math.multiply @M, i_origin # transformed origin
        t_span = i_span * @M[0][0]

        x: t_origin[0]
        y: t_origin[1]
        width: t_span
        height: t_span

    trans_2_vec: (iv) ->
        ov = math.multiply @M, iv
        return ov._data

    main_board_001: ->
        # so with this one we will draw the entire board within a single path command complex
        # which commands should we use ?  just draw lines.  so M absolute and L

        i_span = 180

        i_unit = i_span / 8

        i_origin = [-90, 90, 1]

        [0 .. 8].reduce (acc, i) =>

            if [0 .. 8].indexOf(i) is ([0 ..8].length - 1)
                q_space = ""
            else
                q_space = " "

            i_move = [-90, 90 - (i * i_unit), 1]
            i_horizontal = [90, 90 - (i * i_unit), 1]
            t_move = math.multiply @M, i_move
            t_horizontal = math.multiply @M, i_horizontal
            reef = "M#{t_move[0]} #{t_move[1]} L#{t_horizontal[0]} #{t_horizontal[1]}"
            acc + reef
        , ""

    main_board_002: ->
        # so with this one we will draw the entire board within a single path command complex
        # which commands should we use ?  just draw lines.  so M absolute and L

        i_span = 180

        i_unit = i_span / 8

        i_origin = [-90, 90, 1]

        [0 .. 8].reduce (acc, i) =>

            if [0 .. 8].indexOf(i) is ([0 ..8].length - 1)
                q_space = ""
            else
                q_space = " "

            i_move = [-90 + (i * i_unit), 90, 1]
            i_line = [-90 + (i * i_unit), -90, 1]
            t_move = math.multiply @M, i_move
            t_line = math.multiply @M, i_line
            reef = "M#{t_move[0]} #{t_move[1]} L#{t_line[0]} #{t_line[1]}"
            acc + reef
        , ""

    main_board_003: ->
        i_span = 180
        i_unit = i_span / 8

        rayy_000 = for i in [0 .. 7]
            i = [0 .. 7]

        transforms = for i, idx_i in rayy_000
            do (i) =>
                for j, idx_j in i
                    do (j) =>
                    common_scale_factor = .1

                    translate_x = -90 + ((j + 1) * i_unit) - (i_unit * .5)
                    translate_y = 90 - ((idx_i + 1) * i_unit) + (i_unit * .5)

                    i_transform = [[common_scale_factor, 0, translate_x],[0, common_scale_factor, translate_y], [0, 0, 1]]
                    t_transform = math.multiply @M, i_transform

        transforms





    getInitialState: ->
        check_cell_status = ->


        rayy_000 = for i in [0 .. 7]
            i = [0,0,0,0,0,0,0,0]

        initialState = {}
        for i, idx_i in rayy_000
            do (i, idx_i) ->
                for j, idx_j in i
                    do (j, idx_j) ->
                        mined = Math.random() < .35
                        if mined
                            c "mined"
                            rayy_000[idx_i][idx_j] = "mined"
                            initialState["#{idx_i}#{idx_j}"] = "mined"

        for i, idx_i in rayy_000
            do (i, idx_i) ->
                for j, idx_j in i
                    do (j, idx_j) ->
                        if rayy_000[idx_i][idx_j] isnt 'mined'
                            counter = 0
                            if idx_i > 0
                                if rayy_000[idx_i - 1][idx_j] is 'mined' then counter += 1
                            if idx_i < 7
                                if rayy_000[idx_i + 1][idx_j] is 'mined' then counter += 1
                            if idx_j > 0
                                if rayy_000[idx_i][idx_j - 1] is 'mined' then counter += 1
                            if idx_j < 7
                                if rayy_000[idx_i][idx_j + 1] is 'mined' then counter += 1
                            initialState["#{idx_i}#{idx_j}"] = counter

        c 'initialState', initialState
        initialState







    render: ->
        svg
            width: '100%'
            height: '100%'

            # mb = @main_board_000()
            # rect
            #     x: mb.x
            #     y: mb.y
            #     width: mb.width
            #     height: mb.height
            mb = @main_board_001()
            c 'mb', mb
            path
                d: mb
                stroke: 'black'
            mb_002 = @main_board_002()
            path
                d: mb_002
                stroke: 'black'

            # so there's our board.  but really we don't even need to draw it, as long 
            # as all the status glyphs for the individual grid squares are arranged correctly
            transforms = mb_003 = @main_board_003()
            for i in [0 .. 7]
                for j in [0 .. 7]

                    # circle_vec = math.multiply(transforms[i][j], [0, 0, 1])
                    # circ_radius = 100
                    # circle
                    #     cx: circle_vec[0]
                    #     cy: circle_vec[1]
                    #     r: 20

                    transform_here = transforms[i][j]
                    # anchor_000
                    #     transform_matrix: transform_here
                    switch @state["#{i}#{j}"]
                        when 'mined'
                            mine_000
                                transform_matrix: transform_here
                        when 0
                            zero_000
                                transform_matrix: transform_here
                        when 1
                            one_000
                                transform_matrix: transform_here
                        when 2
                            two_000
                                transform_matrix: transform_here
                        when 3
                            three_000
                                transform_matrix: transform_here
                        when 4
                            four_000
                                transform_matrix: transform_here













module.exports = -> minesweeper