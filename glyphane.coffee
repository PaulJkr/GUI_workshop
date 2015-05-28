

React = require 'react'

c = -> console.log.apply console, arguments

rr = -> React.createFactory(React.createClass.apply(React, arguments))

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a, input} = React.DOM



pigment = rr
    render: ->
        div null,
            input
                value: 'pigment'
                style:
                    height: 200
                    width: 100
                type: 'button',

peel = rr
    render: ->
        div null,
            input
                value: 'peel'
                style:
                    borderRadius: 4
                    backgroundImage: 'url(/adom.jpg)'
                    backgroundSize: '100% 100%'
                    color: 'white'
                    height: 100
                    width: 100
                    filter: 'blur(2px) opacity(40%) saturate(30%) drop-shadow(10px 10px 20px blue)'

                type: 'button',

room_key = rr
    getInitialState: ->
        position: @props.initial_position or {x: 0, y: 0}
        background: 'url(/adom.jpg)'
        backgroundSize: '100% 100%'
        

    mouseOver: (e) ->
        @setState
            background: 'red'
            backgroundSize: ''
    mouseOut: (e) ->
        @setState
            backgroundSize: '100% 100%'
            background: 'url(/adom.jpg)'
            

    render: ->
        div
            onMouseOver: @mouseOver
            onMouseOut: @mouseOut
            onMouseLeave: @mouseOut
            style:
                position: 'relative'
                top: @state.position.y
                left: @state.position.x
                cursor: 'pointer'
                borderRadius: 4
                background: @state.background
                backgroundSize: @state.backgroundSize
                color: 'white'
                height: 90
                width: 90
                #filter: 'opacity(40%) saturate(30%) drop-shadow(10px 10px 20px blue)'
            ,
            p
                style:
                    color: 'white'
                    position: 'relative'
                    top: '40%'
                    left: '30%'
                ,
                "room_key"

room_key_container = rr
    render: ->
        div
            style:
                border: '3px solid black'
                width: 198
                height: 200
                borderRadius: 4
            ,
            abs_position_wrapper
                wrapped_element: room_key
                initial_position: {x: '2%', y: '2%'}
            abs_position_wrapper
                wrapped_element: room_key
                initial_position: {x: '49%', y: '49%'}
            abs_position_wrapper
                wrapped_element: room_key
                initial_position: {x: '2.8%', y: '48%'}
            abs_position_wrapper
                wrapped_element: room_key
                initial_position: {x: '49%', y: '2%'}

rel_position_wrapper = rr
    getInitialState: ->
        position: @props.initial_position or {x: 0, y: 0}
    render: ->
        div
            style:
                position: 'relative'
                top: @state.position.y
                left: @state.position.x
            ,
            @props.wrapped_element()


# this sets position like as if the wrapped component were draggable
# making it possible for the wrapped components to have one consistent
# implementation
abs_position_wrapper = rr
    getInitialState: ->
        position: @props.initial_position or {x: 0, y: 0}
    render: ->
        div
            style:
                position: 'absolute'
                top: @state.position.y
                left: @state.position.x
            ,
            @props.wrapped_element()



module.exports = ->
    pigment: pigment
    peel: peel
    room_key: room_key
    room_key_container: room_key_container
    abs_position_wrapper: abs_position_wrapper