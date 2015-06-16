

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

room_3 = require('./lib/room_3/room_3_main_3_.coffee')()


main = rr
    render: ->

        div
            style:
                background: 'lightgreen'
                position: 'absolute'
                width: window.innerWidth
                left: 0
                right: 0
                top: 0
                bottom: 0
            ,
            sidebar()
            #room_3()



React.render main(), document.body



#React.render(draggable({wrapped_element: root_nav_dash, initial_position:{x: 200, y:200}, height: 170, width: 170}), document.body)






