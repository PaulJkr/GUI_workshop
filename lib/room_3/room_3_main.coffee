


c = -> console.log.apply console, arguments
React = require("react")
#PureRenderMixin = require('react/addons').addons.PureRenderMixin
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require 'shortid'

document.getElementsByTagName('body')[0].style.overflow = 'hidden'




# partition_card = 6
# border_width = 2


room_3_main = rr

    lower_partitionCard: (e) ->
        @setState
            partition_card: @state.partition_card -= 1

    raise_partitionCard: (e) ->
        @setState
            partition_card: @state.partition_card += 1


    change_partitionCard: (e) ->
        c e.currentTarget.value
        @setState
            partition_card: e.currentTarget.value

    getInitialState: ->
        partition_card: 6
        border_width: 2

    fixed_dial_style: (a) ->
        # should do an autohide for this but initially
        position: 'fixed'
        background: 'black'
        width: 120
        height: 60
        right: 0
        top: 40
        border: '3 px solid blue'
        zIndex: 5000

    room_main_div_style : (a) ->
        position: 'absolute'
        background: 'white'
        width: 1024
        height: 768
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
        top: (room_main_div_style.height / @state.partition_card) * j
        left: (room_main_div_style.width / @state.partition_card) * i

    background_calc: (a) ->
        if a is 0 then return 'red'
        if a is 1 then return 'blue'
        if a is 2 then return 'white'
        if a is 3 then return 'purple'

    render: ->
        room_main_div_style = @room_main_div_style()
        fixed_dial_style = @fixed_dial_style()
        div
            style: room_main_div_style
            ,
            div
                style: fixed_dial_style
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

            for j in [0 .. (@state.partition_card - 1)]
                for i in [0 .. (@state.partition_card - 1)]
                    position = @position_calc room_main_div_style, i, j
                    cell_style = @cellular_0_style
                        width: (room_main_div_style.width / @state.partition_card) - (2 * @state.border_width)
                        height: (room_main_div_style.height / @state.partition_card) - (2 * @state.border_width)
                        border_width: @state.border_width
                        border_color: 'black'
                        top: position.top
                        left: position.left
                    background_layer_0_style = @cell_background_layer_style_0
                        background: @background_calc(i)
                        opacity: 0.7
                    if j is 1 then c cell_style
                    div
                        key: i
                        style: cell_style
                        ,
                        div
                            style: background_layer_0_style
                            ,
                        "hello"




module.exports = -> room_3_main