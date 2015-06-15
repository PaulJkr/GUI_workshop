

c = -> console.log.apply console, arguments
React = require("react")
#PureRenderMixin = require('react/addons').addons.PureRenderMixin
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require 'shortid'

document.getElementsByTagName('body')[0].style.overflow = 'hidden'

room_3_main = rr

    do_automata_rule_30: ->  #horrendous implementation here todo redo
        rayy = new Array(@state.partition_card)
        middle_index = Math.floor ( (@state.partition_card - 1) / 2 )
        rayy[middle_index] = 1
        new_background_rayy = @state.background_rayy
        new_background_rayy[@state.generation_card - 1][middle_index] = 'black'
        @setState
            background_rayy: new_background_rayy
        for i, idx in rayy
            if idx isnt middle_index
                rayy[idx] = 0
        recurse = (rayy_2, generation) =>
            if generation < (@state.generation_card - 1)
                imp = @background_calc_automata_0 rayy_2
                new_rayy_3 = new Array(@state.partition_card)
                for j, idx in imp
                    if j is 1
                        new_rayy_3[idx] = 'black'
                    else
                        new_rayy_3[idx] = 'white'
                new_rayy_4 = @state.background_rayy
                new_rayy_4[@state.generation_card - generation] = new_rayy_3
                @setState
                    background_rayy: new_rayy_4
                arguments.callee imp, (generation + 1)

        recurse rayy, 2

    componentDidMount: ->
        window.addEventListener 'resize', (e) =>
            @setState
                innerWidth: window.innerWidth
                innerHeight: window.innerHeight
        @do_automata_rule_30()

    lower_partitionCard: (e) ->
        @setState
            partition_card: @state.partition_card -= 1
        @do_automata_rule_30()

    raise_partitionCard: (e) ->
        @setState
            partition_card: @state.partition_card += 1
        @do_automata_rule_30()

    lower_generationCard: (e) ->
        @setState
            generation_card: @state.generation_card -= 1
        @do_automata_rule_30()

    raise_generationCard: (e) ->
        @setState
            generation_card: @state.generation_card += 1
        @do_automata_rule_30()

    change_partitionCard: (e) ->
        @setState
            partition_card: e.currentTarget.value

    getInitialState: ->
        rayy = new Array(180)
        for i, idx in rayy
            rayy[idx] = new Array(190)
            for j, idx2 in rayy[idx]
                rayy[idx][idx2] = 'white'

        innerWidth: window.innerWidth
        innerHeight: window.innerHeight
        partition_card: 190 #population
        generation_card: 180
        border_width: 1
        background_rayy: rayy

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

    background_calc_automata_0: (rayy) ->
        #c 'rayy', rayy
        population_card = @state.partition_card
        generation_card = @state.generation_card
        # a should be an array of size population card
        # we can check all cells with at least two neighbors and populate the array for the next
        # row
        ampe = for i, idx in rayy
            if (idx is 0) or (idx is (rayy.length - 1))
                0
            else
                if i is 1
                    if rayy[idx + 1] is 1
                        if rayy[idx - 1] is 1
                            0
                        else #rayy[idx - 1] is 0
                            1
                    else #rayy[idx + 1] is 0
                        if rayy[idx - 1] is 1
                            0
                        else #rayy[idx - 1] is 0
                            1
                else #i is 0
                    if rayy[idx + 1] is 1
                        if rayy[idx - 1] is 1
                            0
                        else #rayy[idx - 1] is 0
                            1
                    else #rayy[idx + 1] is 0
                        if rayy[idx - 1] is 1
                            1
                        else #rayy[idx - 1] is 0
                            0

        #c 'ampe', ampe
        return ampe


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
                        background: @state.background_rayy[j][i]
                        opacity: 0.7
                    div
                        ref: "#{j},#{i}"
                        key: "#{j},#{i}"
                        style: cell_style
                        ,
                        div
                            style: background_layer_0_style
                            ,




module.exports = -> room_3_main