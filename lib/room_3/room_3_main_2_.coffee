#TODO : do the calc in webworkers and when get the callback
# async call the render function for that.  until then show a "it's computing"
# message.
# also do, use immutable data structures and try addon performance monitoring tool
# interesting exercise to find the source of the heavy cpu load.  is it all the array traversals ?

{React, c, rr, shortid} = require('./boilerplate.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol,
code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon,
image, pattern, filter, feBlend, feOffset, polyline} = React.DOM

document.getElementsByTagName('body')[0].style.overflow = 'hidden'

room_3_main = rr

    populate_to_automata_rule_30_1: () ->
        rayy = new Array(@state.partition_card)
        for i, idx in rayy
            if idx is Math.floor(@state.partition_card / 2)
                rayy[idx] = 0
            else
                rayy[idx] = 1
        for i in [0 .. (@state.generation_card - 1)]
            rayy = @background_calc_automata_0 rayy
            for j in [0 .. (@state.partition_card - 1)]
                if rayy[j] is 1
                    @setState do => "#{i},#{j}": 'black'
                else
                    @setState do => "#{i},#{j}": 'white'

    componentDidMount: ->
        window.addEventListener 'resize', (e) =>
            @setState
                innerWidth: window.innerWidth
                innerHeight: window.innerHeight

        @populate_to_automata_rule_30_1()

    lower_partitionCard: (e) ->
        @setState
            partition_card: @state.partition_card - 1
        @set_board()
        @populate_to_automata_rule_30_1()

    raise_partitionCard: (e) ->
        @setState
            partition_card: @state.partition_card + 1
        @set_board()
        @populate_to_automata_rule_30_1()

    lower_generationCard: (e) ->
        @setState
            generation_card: @state.generation_card - 1
        @set_board()
        @populate_to_automata_rule_30_1()

    raise_generationCard: (e) ->
        @setState
            generation_card: @state.generation_card + 1
        @set_board()
        @populate_to_automata_rule_30_1()

    set_board: ->
        generation_card = @state?.generation_card or 200
        partition_card = @state?.partition_card or 200

        transient_piece = {}
        for i in [0 .. (generation_card - 1)]
            for j in [0 .. (partition_card - 1)]
                if (i is 0) and (j is Math.floor(partition_card / 2))
                    transient_piece["#{i},#{j}"] = 'black'
                else
                    transient_piece["#{i},#{j}"] = 'white'
        return transient_piece

    getInitialState: ->
        generation_card = 200
        partition_card = 200

        transient_piece = @set_board()
        final_obj =
            innerWidth: window.innerWidth
            innerHeight: window.innerHeight
            partition_card: partition_card #population
            generation_card: generation_card
            border_width: 0
        Object.assign final_obj, transient_piece
        return final_obj

    fixed_dial_style: (a) ->
        # should do an autohide for this but initially
        position: 'fixed'
        #background: 'black'
        width: 80
        height: 60
        right: 0
        top: 40
        border: '3px solid blue'
        borderRadius: 6
        zIndex: 5000

    room_main_div_style : (a) ->
        #zIndex: -50
        position: 'absolute'
        background: 'white'
        width: @state.innerWidth
        height: @state.innerHeight
        left: 0
        top: 0
        bottom: 0
        right: 0

    cellular_0_style : (a) ->
        position: 'absolute'
        border: "#{a.border_width}px solid #{a.border_color}"
        width: a.width
        height: a.height
        left: a.left or ''
        top: a.top or ''
        bottom: a.bottom or ''
        right: a.right or ''

    cell_background_layer_style_0 : (a) ->
        # want this in a separate div so can adjust the opacity separately, we can make multiple layers
        position: 'absolute'
        background: a.background or 'lightgrey'
        opacity: a.opacity or 1
        width: '100%'
        height: '100%'

    position_calc: (room_main_div_style, i, j) ->
        top: (room_main_div_style.height / @state.generation_card) * j
        left: (room_main_div_style.width / @state.partition_card) * i

    # rule_30_calc_next_state_0: (rayy) -> # array of present state
    background_calc_automata_0: (rayy) -> # array of present state
        next_state = for i, idx in rayy
            if (idx is 0) or (idx is (rayy.length - 1))
                0
            else
                if i is 1
                    if rayy[idx + 1] is 1
                        if rayy[idx - 1] is 1
                            0
                        else
                            1
                    else
                        if rayy[idx - 1] is 1
                            0
                        else
                            1
                else
                    if rayy[idx + 1] is 1
                        if rayy[idx - 1] is 1
                            0
                        else
                            1
                    else
                        if rayy[idx - 1] is 1
                            1
                        else
                            0
        return next_state
    
    # would like to do something similar to this which satisfies 
    # graph coloring constrains in different ways
    background_calc: (a) ->
        if (a % 4) is 0 then return 'red'
        if (a % 4) is 1 then return 'blue'
        if (a % 4) is 2 then return 'white'
        if (a % 4) is 3 then return 'purple'

    render: ->
        room_main_div_style = @room_main_div_style()
        fixed_dial_style = @fixed_dial_style()
        div
            style: room_main_div_style
            ,
            div
                style: fixed_dial_style
                ,
                div
                    style:
                        position: 'absolute'
                        width: '100%'
                        height: '100%'
                        background: 'black'
                        opacity: 0.7
                    ,
                div
                    style:
                        position: 'absolute'
                    ,
                    span
                        style:
                            background: 'white'
                        ,
                        @state.partition_card
                    input
                        type: 'button'
                        onClick: @raise_partitionCard
                    input
                        type: 'button'
                        onClick: @lower_partitionCard
                div
                    style:
                        position: 'absolute' 
                        top: '50%'
                    ,
                    span
                        style:
                            background: 'white'
                        ,
                        @state.generation_card
                    input
                        type: 'button'
                        onClick: @raise_generationCard
                    input
                        type: 'button'
                        onClick: @lower_generationCard

            for j in [0 .. (@state.generation_card - 1)]
                for i in [0 .. (@state.partition_card - 1)]
                    position = @position_calc room_main_div_style, i, j
                    cell_style = @cellular_0_style
                        width: (room_main_div_style.width / @state.partition_card) - (2 * @state.border_width)
                        height: (room_main_div_style.height / @state.generation_card) - (2 * @state.border_width)
                        border_width: @state.border_width
                        border_color: 'black'
                        top: position.top
                        left: position.left
                    background_layer_0_style = @cell_background_layer_style_0
                        background: @state["#{j},#{i}"]
                        opacity: 0.7
                    div
                        key: shortid.generate()
                        style: cell_style
                        ,
                        div
                            style: background_layer_0_style
                            ,

module.exports = -> room_3_main