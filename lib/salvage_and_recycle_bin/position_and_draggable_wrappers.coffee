




module.exports = ->
    c = -> console.log.apply console, arguments
    #React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a, input} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

    abs_position_wrapper : rr
        getInitialState: ->
            position_format =
                left : '0%'
                right : null
                top : '0%'
                bottom : null
            position: @props.initial_position or position_format
        render: ->
            div
                style:
                    width: @props.width or ''
                    height: @props.height or ''
                    position: 'absolute'
                    top: @state.position.top or ''
                    left: @state.position.left or ''
                    right: @state.position.right or ''
                    bottom: @state.position.bottom or ''
                ,
                @props.wrapped_element @props.passed_props
                # could also pass props here

    draggable : rr
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