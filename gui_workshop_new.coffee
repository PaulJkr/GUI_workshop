

c = console.log.apply console, arguments

root_nav_dash = require('./lib/root_nav_dash.coffee')()
old_room_0 = require('./lib/old_room_0.coffee')
{abs_position_wrapper, draggable} = require('./lib/position_and_draggable_wrappers.coffee')()

React= require 'react'

#React.render old_room_0()(), document.body
# this works ^

React.render(abs_position_wrapper({wrapped_element: root_nav_dash, initial_position:{x: 20, y:20}, height: 400, width: 600}), document.body)




