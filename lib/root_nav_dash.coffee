

module.exports = ->

    c = -> console.log.apply console, arguments
    React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a, input} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))


    {abs_position_wrapper, draggable} = require('./position_and_draggable_wrappers.coffee')()

    room_key = require('./room_key.coffee')()

    rr

        render: ->
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
                    width: '40%'
                    height: '40%'
                    wrapped_element: room_key
                    initial_position: {x: '4%', y: '2%'}
                abs_position_wrapper
                    width: '40%'
                    height: '40%'
                    wrapped_element: room_key
                    initial_position: {x: '50%', y: '48%'}
                abs_position_wrapper
                    width: '40%'
                    height: '40%'
                    wrapped_element: room_key
                    initial_position: {x: '4%', y: '48%'}
                abs_position_wrapper
                    width: '40%'
                    height: '40%'
                    wrapped_element: room_key
                    initial_position: {x: '50%', y: '2%'}
                    passed_props:
                        room_id: 4






