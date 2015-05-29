
# this was a temporary thing to get started; i'm in the process now of
# properly organising things


React = require("react")
c = -> console.log.apply console, arguments
rr = -> React.createFactory(React.createClass.apply(React, arguments))



draggable = require('./draggable.coffee')().draggable_000

draggable2 = require('./draggable_2.coffee')().draggable_222

{div, h1, h3} = React.DOM

{pigment, peel, room_key, room_key_container, abs_position_wrapper} = require('./glyphane.coffee')()

old_room_0 = rr
    render: ->
        div
            style:
                borderRadius: 4
                position: 'absolute'
                backgroundImage: 'url(/adom.jpg)'
                backgroundSize: '100% 30%'
                backgroundRepeat: 'no-repeat'
                width: '99%'
                height: '99%'
            ,
                draggable(curtain)
                    initial_position: {x: 20, y: 20}
                draggable(pigment)
                    initial_position: {x: 100, y: 300}
                draggable(peel)
                    initial_position: {x: 300, y: 400}
                draggable2
                    width: 80
                    height: 80
                    wrapped_element: room_key
                    initial_position: {x: 400, y: 400}
                abs_position_wrapper
                    wrapped_element: room_key
                    initial_position: {x: 540, y: 400}
                    height: 100
                    width: 100
                    passed_props:
                        room_id: 3
                #draggable(room_key_container)
                    #initial_position: {x: 800, y: 400}
                # dragg_2
                #     wrapped_child: room_key
                #     wrapped_child_initial
                abs_position_wrapper
                    width: '20em'
                    height: '20em'
                    wrapped_element: room_key_container
                    initial_position: {x: '65%', y: '50%'}








module.exports = old_room_0



