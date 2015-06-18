

{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

# TODO implement categories/submenus; submenus float up when pick some category
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline} = React.DOM

room_3_2 = require('../room_3/room_3_main_2_.coffee')()
room_2 = require('../room_2/main.coffee')()

sidebar = rr
    dim_sidebar: ->
        @interval = setInterval =>
            if @state.opacity <= 0
                clearInterval @interval
            else
                @setState
                    opacity: @state.opacity - .03
        , 10

    mouseOut: ->
        @dim_sidebar()

    mouseEnter: ->
        if @interval
            clearInterval @interval
        @setState
            opacity: 1

    getInitialState: ->
        opacity: 0

    render: ->
        div
            onMouseEnter: @mouseEnter
            onMouseLeave: @mouseOut
            style:
                zIndex: 5000
                position: 'fixed'
                width: 20
                height: window.innerHeight
                top: 0
                right: 0
                opacity: @state.opacity
            ,
            div
                style:
                    position: 'absolute'
                    width: 100
                    height: 500
                    right: 0
                    top: 100
                ,
                div
                    style:
                        position: 'absolute'
                        width: '100%'
                        height: '100%'
                        background: 'blue'
                        opacity: 0.4
                        border: '1px solid blue'
                        borderRadius: 3
                    ,
                div
                    style:
                        position: 'absolute'
                        width: '100%'
                        height: '100%'
                    ,
                    input
                        onClick: @props.room_2
                        type: 'button'
                        value: "room 2"
                    input
                        onClick: @props.rule_30
                        type: 'button'
                        value: "rule 30"
                    input
                        onClick: @props.room_3_1
                        type: 'button'
                        value: "room_3_1"
                    input
                        onClick: @props.buttons__grid
                        type: 'button'
                        value: "buttons"

module.exports = -> sidebar

