

module.exports = ->

    c = -> console.log.apply console, arguments
    React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a, input} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))


    {abs_position_wrapper, draggable} = require('./position_and_draggable_wrappers.coffee')()

    room_key = require('./room_key.coffee')()

    rr
        componentWillMount: ->

        render: ->
            room_key_width = '46%'
            room_key_height = '46%'
            room_key_margin = '2%'

            div
                style:
                    background: 'lightgrey'
                    position: 'relative'
                    border: '3px solid black'
                    width: '100%'
                    height: '100%'
                    borderRadius: 4
                ,
                abs_position_wrapper
                    width: room_key_width
                    height: room_key_height
                    wrapped_element: room_key
                    initial_position:
                        left: room_key_margin
                        top: room_key_margin

                abs_position_wrapper
                    width: room_key_width
                    height: room_key_height
                    wrapped_element: room_key
                    initial_position:
                        right: room_key_margin
                        top: room_key_margin
                abs_position_wrapper
                    width: room_key_width
                    height: room_key_height
                    wrapped_element: room_key
                    initial_position:
                        right: room_key_margin
                        bottom: room_key_margin
                abs_position_wrapper
                    width: room_key_width
                    height: room_key_height
                    wrapped_element: room_key
                    initial_position:
                        left: room_key_margin
                        bottom: room_key_margin
                    passed_props:
                        room_id: 4


# position by maths and get DOM nodes dimension in pixels and do the math
# even though the argument given will be in terms of percentage

# container_width <pixels>, container_height <pixels>
# room_key_width <pixels>, room_key_height <pixels>
# from this we need to give a left percentage and a top percentage
# also if there is text it may be possible to specify its size in percentage

# but that ^ won't work because we don't have a dom node yet, as it hasn't
# been mounted.  should be able to do it just with the percentages. or could alternate left and right






