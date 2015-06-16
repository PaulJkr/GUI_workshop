

c = -> console.log.apply console, arguments
React = require("react")
#PureRenderMixin = require('react/addons').addons.PureRenderMixin
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require 'shortid'

document.getElementsByTagName('body')[0].style.overflow = 'hidden'

room_3_2 = require('../room_3/room_3_main_2_.coffee')()

sidebar = rr

    render_rule_30: ->
        React.render room_3_2(), document.body

    mouseOut: ->
        @setState
            opacity: 0

    mouseEnter: ->
        @setState
            opacity: 1

    getInitialState: ->
        opacity: 0

    render: ->
        c 'window.innerHeight', window.innerHeight

        div
            onMouseEnter: @mouseEnter
            onMouseLeave: @mouseOut
            style:
                position: 'fixed'
                width: 200
                height: window.innerHeight
                top: 0
                right: 0
                opacity: @state.opacity
            ,
            div
                style:
                    position: 'absolute'
                    width: 80
                    height: 600
                    right: 0
                    top: 40
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
                        onClick: @render_rule_30
                        type: 'button'
                        value: "rule 30"
                        ,





module.exports = -> sidebar