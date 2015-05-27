

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
    render: ->
        div null,
            div
                style:
                    cursor: 'pointer'
                    borderRadius: 4
                    backgroundImage: 'url(/adom.jpg)'
                    backgroundSize: '100% 100%'
                    color: 'white'
                    height: 100
                    width: 100
                    filter: 'opacity(40%) saturate(30%) drop-shadow(10px 10px 20px blue)'
                ,
                p
                    style:
                        color: 'white'
                        position: 'absolute'
                        top: '60%'
                        left: '30%'
                    ,
                    "room_key"

room_key_container = rr
    render: ->
        div
            style:
                border: '3px solid black'
                width: 180
                height: 180
                borderRadius: 4
            ,
            room_key()



module.exports = ->
    pigment: pigment
    peel: peel
    room_key: room_key
    room_key_container: room_key_container