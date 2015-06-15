


c = -> console.log.apply console, arguments
React = require("react")
#PureRenderMixin = require('react/addons').addons.PureRenderMixin
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require 'shortid'

document.getElementsByTagName('body')[0].style.overflow = 'hidden'




partition_card = 4
border_width = 2


room_3_main = rr


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
        top: (room_main_div_style.height / partition_card) * j
        left: (room_main_div_style.width / partition_card) * i

    background_calc: (a) ->
        if a is 0 then return 'red'
        if a is 1 then return 'blue'
        if a is 2 then return 'white'
        if a is 3 then return 'purple'

    render: ->
        room_main_div_style = @room_main_div_style()
        div
            style: room_main_div_style
            ,
            for j in [0 .. (partition_card - 1)]
                for i in [0 .. (partition_card - 1)]
                    position = @position_calc room_main_div_style, i, j
                    cell_style = @cellular_0_style
                        width: (room_main_div_style.width / partition_card) - (2 * border_width)
                        height: (room_main_div_style.height / partition_card) - (2 * border_width)
                        border_width: border_width
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