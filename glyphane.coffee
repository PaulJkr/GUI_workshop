

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

room_4 = rr
    render: ->
        abs_position_wrapper
            width: '20em'
            height: '20em'
            wrapped_element: room_key_container
            initial_position: {x: '65%', y: '50%'}

rooms = {} ; rooms[4] = room_4

room_key = rr
    getInitialState: ->
        position: @props.initial_position or {x: 0, y: 0}
        background: 'url(/adom.jpg)'
        backgroundSize: '100% 100%'
        filter: 'drop-shadow(1px 1px 2px red)'
        

    mouseOver: (e) ->
        @setState
           #background: @props.testing
            #backgroundSize: ''
            filter: 'opacity(40%) saturate(30%) drop-shadow(10px 10px 20px blue)'
    mouseOut: (e) ->
        @setState
            #backgroundSize: '100% 100%'
            #background: 'url(/adom.jpg)'
            filter: ''

    render_room: ->
        if @props.room_id is 4
            React.render rooms[@props.room_id](), document.body


    onClick: (e) ->
        @setState
            filter: 'opacity(80%) saturate(30%) drop-shadow(10px 10px 20px blue)'
        setTimeout =>
            @setState
                filter: 'drop-shadow(10px 10px 20px red)'
            @render_room()
        , 400

    render: ->
        div
            onClick: @onClick
            onMouseOver: @mouseOver
            onMouseOut: @mouseOut
            onMouseLeave: @mouseOut
            style:

                # position: 'absolute'
                top: @state.position.y
                left: @state.position.x

                cursor: 'pointer'
                borderRadius: 4
                background: @state.background
                backgroundSize: @state.backgroundSize
                color: 'white'
                height: '100%'
                width: '100%'
                #filter: 'opacity(40%) saturate(30%) drop-shadow(10px 10px 20px blue)'
                filter: @state.filter
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
                width: @props.width or ''
                height: @props.height or ''
                position: 'absolute'
                top: @state.position.y
                left: @state.position.x
            ,
            @props.wrapped_element @props.passed_props
            # could also pass props here



module.exports = ->
    pigment: pigment
    peel: peel
    room_key: room_key
    room_key_container: room_key_container
    abs_position_wrapper: abs_position_wrapper