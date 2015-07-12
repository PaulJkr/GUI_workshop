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

empty_water_000 = require('./lib/generic_empty_water_000_.coffee')()


# todo : the macro thing where if you hit zero it 
# automatically reveals all those adjacent squares


minesweeper = rr

    trans_2_vec: (iv) ->
        ov = math.multiply @M, iv
        return ov._data

    main_board_001: ->
        M = @props.transform_matrix
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
            t_move = math.multiply M, i_move
            t_horizontal = math.multiply M, i_horizontal
            reef = "M#{t_move[0]} #{t_move[1]} L#{t_horizontal[0]} #{t_horizontal[1]}"
            acc + reef
        , ""

    main_board_002: ->
        M = @props.transform_matrix
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
            t_move = math.multiply M, i_move
            t_line = math.multiply M, i_line
            reef = "M#{t_move[0]} #{t_move[1]} L#{t_line[0]} #{t_line[1]}"
            acc + reef
        , ""

    main_board_003: ->
        M = @props.transform_matrix
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
                    t_transform = math.multiply M, i_transform
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
                        mined = Math.random() < .09
                        if mined
                            rayy_000[idx_i][idx_j] = "mined"
                            initialState["#{idx_i}#{idx_j}"] = [0, 0, "mined"]

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
                            initialState["#{idx_i}#{idx_j}"] = [0, 0, counter] # [<shown>, <flagged>, value]


        assign initialState, game_state : "in_progress"






    change_gameState: (a) ->
        @setState
            game_state: a

    toggle_flag: (idx) ->
        i = idx[0]
        j = idx[1]
        cursor = @state["#{i}#{j}"]
        value = cursor[2]
        flag = parseInt(cursor[1])
        if flag is 0
            @setState
                "#{i}#{j}": [0, 1, value]
        else
            @setState
                "#{i}#{j}": [0, 0, value]



    reveal: (idx, state, setState, forceUpdate) ->
        i = idx[0]
        j = idx[1]
        if @state isnt undefined
            cursor = @state["#{i}#{j}"]
            state = @state
            setState = @setState
            forceUpdate = @forceUpdate
            state["#{i}#{j}"] = [1, 0, cursor[2]]
            forceUpdate()

            # @setState
            #     "#{i}#{j}": [1, 0, cursor[2]]

        else
            cursor = state["#{i}#{j}"]
            state["#{i}#{j}"] = [1, 0, cursor[2]]
            forceUpdate()

            # setState
            #     "#{i}#{j}": [1, 0, cursor[2]]
    
        value = cursor[2]
        if value is 0
            if (i < 7)
                arguments.callee [i + 1, j], state, setState, forceUpdate
            if (i > 0)
                arguments.callee [i - 1, j], state, setState, forceUpdate
            if (j > 0)
                arguments.callee [i, j - 1], state, setState, forceUpdate
            if (j < 7)
                arguments.callee [i, j + 1], state, setState, forceUpdate






    render: ->
        M = @props.transform_matrix
        svg
            width: '100%'
            height: '100%'
            mb = @main_board_001()
            path
                d: mb
                stroke: 'black'
            mb_002 = @main_board_002()
            path
                d: mb_002
                stroke: 'black'


            transforms = @main_board_003()


            for i in [0 .. 7]
                for j in [0 .. 7]
                    cursor = @state["#{i}#{j}"]
                    if cursor[2] is 'mined'
                        mine_000
                            transform_matrix: transforms[i][j]
                            index: [i,j]
                            cursor: cursor #info on flagged
                            toggle_flag: @toggle_flag
                            reveal: @reveal
                    else
                        empty_water_000
                            transform_matrix: transforms[i][j]
                            index: [i,j]
                            cursor: cursor
                            toggle_flag: @toggle_flag
                            reveal: @reveal














module.exports = -> minesweeper