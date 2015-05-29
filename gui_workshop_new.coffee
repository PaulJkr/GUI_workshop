

c = console.log.apply console, arguments

root_nav_dash = require('./lib/root_nav_dash.coffee')()
old_room_0 = require('./lib/old_room_0.coffee')
{abs_position_wrapper, draggable} = require('./lib/position_and_draggable_wrappers.coffee')()

React= require 'react'

#React.render old_room_0()(), document.body
# this works ^

React.render(draggable({wrapped_element: root_nav_dash, initial_position:{x: 200, y:200}, height: 170, width: 170}), document.body)




