


#React = require 'react'

c = -> console.log.apply console, arguments

rr = -> React.createFactory(React.createClass.apply(React, arguments))

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM


draggable_222 = rr
    getInitialState: ->
        position: @props.initial_position or {x: 0, y:0}

    addDragEvents: ->
        document.addEventListener 'mousemove', @onMouseMove
        document.addEventListener 'mouseup', @onMouseUp

    removeDragEvents: ->
        document.removeEventListener 'mousemove', @onMouseMove
        document.removeEventListener 'mouseup', @onMouseUp

    onMouseUp: (e) ->
        @removeDragEvents()

    onMouseDown: (e) ->
        e.stopPropagation()
        @addDragEvents()
        pageOffset = e.currentTarget.getBoundingClientRect()
        @setState
            originX: e.pageX
            originY: e.pageY
            elementX: pageOffset.left
            elementY: pageOffset.top

    onMouseMove: (e) ->
        deltaX = e.pageX - @state.originX
        deltaY = e.pageY - @state.originY

        @setState
            position:
                x: @state.elementX + deltaX + document.body.scrollLeft
                y: @state.elementY + deltaY + document.body.scrollTop

    style: =>
        position: 'absolute'
        left: @state.position.x
        top: @state.position.y
        zIndex: 9999

    render: ->
        div
            style:
                width: @props.width or ''
                height: @props.height or ''
                cursor: 'pointer'
                position: 'absolute'
                left: @state.position.x
                top: @state.position.y
                zIndex: 9999
            onMouseDown: @onMouseDown
            ,
            @props.wrapped_element @props.wrapped_element_props

module.exports = ->
    draggable_222: draggable_222