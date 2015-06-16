

c = -> console.log.apply console, arguments
require('./lib/main.styl')
root_nav_dash = require('./lib/root_nav_dash.coffee')()
#old_room_0 = require('./lib/old_room_0.coffee')
{abs_position_wrapper, draggable} = require('./lib/position_and_draggable_wrappers.coffee')()

React= require 'react'
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))




#React.render old_room_0()(), document.body
# this works ^


# void_main = rr
#     render: ->
#         div
#             style:
#                 position: 'absolute'
#                 top: document.body.clientTop
#                 left: document.body.clientLeft
#                 #width: document.body.clientWidth
#                 width: '100%'
#                 #height: document.body.clientHeight
#                 height: '100%'
#                 #backgroundColor: 'grey'
#         ,
#             draggable
#                 wrapped_element: root_nav_dash
#                 initial_position:
#                     x: document.body.clientWidth / 10
#                     #y: document.body.clientHeight /10
#                     y: '2%'
#                 height: 170
#                 width: 170

sidebar = require('./lib/nav_sidebar/sidebar_0_.coffee')()

room_2 = require('./lib/room_2/main.coffee')()

room_3 = require('./lib/room_3/room_3_main_2_.coffee')()

initialContent = rr
    render: ->
        div null, ""

screenHint = rr
    componentDidMount: ->
        setTimeout =>
            c "should self destruct now"
            @props.remove_screenHint()
        , 2000
    render: ->
        div
            style:
                width: 300
                height: 160
                position: 'fixed'
                top: window.innerHeight / 3
                left: window.innerWidth / 3
                fontSize: 30
                fontFamily: 'lucinda'
                color: 'grey'
                border: '3px solid grey'
                borderRadius: 4
                padding: 20
            ,
            h3 null, "there is a hidden menu on the side of the screen ===>"


main = rr
    remove_screenHint: ->
        c 'should try'
        @setState
            screenHint: -> c "gone"
    changeContent: ->
        @setState
            content: arguments[0]
            
    getInitialState: ->
        content: initialContent
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
            @state.content()
            sidebar
                room_2: @changeContent.bind(@, room_2)
                rule_30: @changeContent.bind(@, room_3)
            @state.screenHint
                remove_screenHint: @remove_screenHint.bind(@)
            
            



React.render main(), document.body



#React.render(draggable({wrapped_element: root_nav_dash, initial_position:{x: 200, y:200}, height: 170, width: 170}), document.body)






