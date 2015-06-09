

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
c document.body
void_main = rr
    render: ->
        div
            style:
                position: 'absolute'
                top: document.body.clientTop
                left: document.body.clientLeft
                #width: document.body.clientWidth
                width: '100%'
                #height: document.body.clientHeight
                height: '100%'
                #backgroundColor: 'grey'
        ,
            draggable
                wrapped_element: root_nav_dash
                initial_position:
                    x: document.body.clientWidth / 10
                    #y: document.body.clientHeight /10
                    y: '2%'
                height: 170
                width: 170


imp = void_main
    x: 'some variable'
    y: 'some variable'

React.render imp, document.body



#React.render(draggable({wrapped_element: root_nav_dash, initial_position:{x: 200, y:200}, height: 170, width: 170}), document.body)






