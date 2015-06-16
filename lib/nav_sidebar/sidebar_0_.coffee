

c = -> console.log.apply console, arguments
React = require("react")
#PureRenderMixin = require('react/addons').addons.PureRenderMixin
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require 'shortid'

document.getElementsByTagName('body')[0].style.overflow = 'hidden'

room_3_2 = require('../room_3/room_3_main_2_.coffee')()

room_2 = require('../room_2/main.coffee')()

sidebar = rr

    # render_room_2: ->
    #     @props.room_2 room_2

    # render_rule_30: ->
    #     React.render room_3_2(), document.body

    mouseOut: ->
        @setState
            opacity: 0

    mouseEnter: ->
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
                    width: 60
                    height: 300
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
                        #onClick: @render_room_2      #@props.room_2        #@render_rule_30
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

module.exports = -> sidebar