


React = require 'react'

c = -> console.log.apply console, arguments

rr = -> React.createFactory(React.createClass.apply(React, arguments))

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM



module.exports = ->



  # this is a wrapper component for making other components draggable, by composition within this one
# this may not be the most elegant pattern for composition .
  draggable_000 : (a, passthrough) ->  # for composition instead of mixin
    rr
      getInitialState: ->
        position: @props.initial_position

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
            cursor: 'pointer'
            position: 'absolute'
            left: @state.position.x
            top: @state.position.y
            zIndex: 9999
          onMouseDown: @onMouseDown
          ,
          a passthrough