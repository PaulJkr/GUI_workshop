
c = -> console.log.apply console, arguments
require('./lib/main.styl')

React= require 'react'
#PureRenderMixin = require('react/addons').addons.PureRenderMixin
update = require('react/addons').addons.update
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require('shortid')

#old_room_0 = require('./lib/old_room_0.coffee')
{abs_position_wrapper, draggable} = require('./lib/position_and_draggable_wrappers.coffee')()
root_nav_dash = require('./lib/root_nav_dash.coffee')()
sidebar = require('./lib/nav_sidebar/sidebar_0_.coffee')()
room_2 = require('./lib/room_2/main.coffee')()
rule_30_0 = require('./lib/room_3/room_3_main_2_.coffee')()
room_3_0 = require('./lib/room_3/room_3_main_0_.coffee')()
room_3_1 = require('./lib/room_3/room_3_main_1_.coffee')()
room_3_3 = require('./lib/room_3/room_3_main_3_.coffee')()
screenHint = require('./lib/screen_hint_.coffee')()

main = rr
    remove_screenHint: ->
        c 'should try'
        @setState
            screenHint: -> c "gone"
    changeContent: ->
        @setState
            content: arguments[0]
            
    getInitialState: ->
        content: -> room_3_1()
        screenHint: screenHint

    render: ->
        div
            style:
                position: 'absolute'
                width: window.innerWidth
                left: 0
                right: 0
                top: 0
                bottom: 0
            ,
            @state.content?()
            sidebar
                room_2: @changeContent.bind(@, room_2)
                rule_30: @changeContent.bind(@, rule_30_0)
                room_3_1: @changeContent.bind @, room_3_1
            @state.screenHint
                remove_screenHint: @remove_screenHint#.bind(@)

React.render main(), document.body
