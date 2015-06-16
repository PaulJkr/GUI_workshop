

c = -> console.log.apply console, arguments
React = require("react")
#PureRenderMixin = require('react/addons').addons.PureRenderMixin
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require 'shortid'

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

    lower_partitionCard: (e) ->
        @setState
            partition_card: @state.partition_card -= 1
        @set_board()
        @populate_to_automata_rule_30_1()

    raise_partitionCard: (e) ->
        @setState
            partition_card: @state.partition_card += 1
        @set_board()
        @populate_to_automata_rule_30_1()

    lower_generationCard: (e) ->
        @setState
            generation_card: @state.generation_card -= 1
        @set_board()
        @populate_to_automata_rule_30_1()

    raise_generationCard: (e) ->
        @setState
            generation_card: @state.generation_card += 1
        @set_board()
        @populate_to_automata_rule_30_1()

    set_board: ->
        generation_card = @state?.generation_card or 100
        partition_card = @state?.partition_card or 130

        transient_piece = {}
        for i in [0 .. (generation_card - 1)]
            for j in [0 .. (partition_card - 1)]
                if (i is 0) and (j is Math.floor(partition_card / 2))
                    transient_piece["#{i},#{j}"] = 'black'
                else
                    transient_piece["#{i},#{j}"] = 'white'
        return transient_piece

    getInitialState: ->
        generation_card = 100
        partition_card = 130

        #transient_piece = @set_board()
        final_obj =
            innerWidth: window.innerWidth
            innerHeight: window.innerHeight
            partition_card: partition_card #population
            generation_card: generation_card
            border_width: 0
        #Object.assign final_obj, transient_piece
        return final_obj



    room_main_div_style : (a) ->
        zIndex: 300
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

    rule_30_calc_next_state_0: (rayy) -> # array of present state
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
    


    render: ->
        room_main_div_style = @room_main_div_style()
        div
            style: room_main_div_style
            ,
            # div #dedicated background container
            #     style:
            #         zIndex: 500
            #         position: 'absolute'
            #         width: '100%'
            #         height: '100%'
            #         background: 'linear-gradient(145deg, purple, red)'
            #         opacity: .21
            #     ,
            svg
                style:
                    zIndex: 10000
                    top: 0
                width: '100%'
                height: '100%'
                ,
                # polygon
                #     style:
                #         zIndex: 300000
                #     fill: 'black'
                #     points: "10,10 100,10 110,110, 10,110"
                polygon
                    fill: 'black'
                    points: "0,0 #{@state.innerWidth / 2},0 #{@state.innerWidth / 2},#{@state.innerHeight / 2} 0,#{@state.innerHeight / 2}"
                circle
                    cx: 10
                    cy: 10
                    r: 30
                    fill: 'black'


module.exports = -> room_3_main