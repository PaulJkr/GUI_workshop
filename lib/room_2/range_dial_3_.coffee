
c = -> console.log.apply console, arguments
React = require("react")
PureRenderMixin = require('react/addons').addons.PureRenderMixin
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require('shortid')

# This dial has a slider control, two buttons. and an instrument dial which tells percentage state.
# The buttons should be classed eventually, but initially (avoiding premature optimisation) will be separate modules, and maybe approaches.  The buttons and the slider will be custom svg complexes, ~~each go in separate files~~.  This file will just compose them into the whole range dial complex described above..

slider_1 = rr # a bunch of components all in an svg
    getInitialState: ->
        position:
            x: @props.range * 2

    addDragEvents: ->
        document.addEventListener 'mousemove', @onMouseMove
        document.addEventListener 'mouseup', @onMouseUp
    removeDragEvents: ->
        document.removeEventListener 'mousemove', @onMouseMove
        document.removeEventListener 'mouseup', @onMouseUp
    onMouseUp: (e) ->
        @removeDragEvents()
        imp = React.findDOMNode(@refs.shuttle)

        ticket = (imp.cx.animVal.value - 20) / 2

    onMouseDown: (e) ->

        e.preventDefault()
        e.stopPropagation()
        @addDragEvents()
        pageOffset = e.currentTarget.getBoundingClientRect()

        @setState
            originX: e.pageX
            # originY: e.pageY
            elementX: pageOffset.left
            # elementY: pageOffset.top
    onMouseMove: (e) ->
        deltaX = e.pageX - @state.originX
        if (e.pageX - 620) < 0
            cursor = 0
        else if (e.pageX - 620) > 220
            cursor = 200
        else
            cursor = e.pageX - 620
        @setState
            position:
                x: cursor
                #x: @state.elementX + deltaX + document.body.scrollLeft
        #         y: @state.elementY + deltaY + document.body.scrollTop
        imp = React.findDOMNode(@refs.shuttle)

        ticket = (imp.cx.animVal.value - 20) / 2
        if ticket > 100
            ticket = 100

        @props.rangeChange ticket

    render: ->
        grad_0_z = shortid.generate()
        div null
            ,
            svg
                width: 400
                height: 400
                viewPort: '0 0 400 400'
                ,
                defs
                    linearGradient
                        id: grad_0_z
                        x1: "0%"
                        y1: "0%"
                        x2: "100%"
                        y2: "0%"
                        ,
                        stop
                            offset: "0%"
                            style:
                                stopColor:'rgb(0,255,255)'
                                stopOpacity:0.7
                        stop
                            offset: "100%"
                            style:
                                stopColor:'rgb(0,255,0)'
                                stopOpacity:0.6
                path
                    d: "M 20 100 H 220"
                    stroke:'black'
                    strokeWidth: 3
                polyline
                    points: "20 110 20 120 40 120 40 110 40 120 60 120 60 110 60 120 80 120 80 110 80 120 100 120 100 110 100 120 120 120 120 110 120 120 140 120 140 110 140 120 160 120 160 110 160 120 180 120 180 110 180 120 200 120 200 110 200 120 220 120 220 110"
                    stroke: 'black'
                    fill: 'none'
                path
                    opacity: 0.5
                    d: "M #{20 + @state.position.x - 15} 90 L #{20 + @state.position.x} 110 L #{20 + @state.position.x + 15} 90"
                    stroke: 'black'
                circle
                    opacity: 0.7
                    id: 'shuttle'
                    key: 'thaeunth'
                    ref: 'shuttle'
                    onMouseDown: @onMouseDown
                    cx: 20 + @state.position.x
                    cy: 100
                    r: 10
                    fill: "url(##{grad_0_z})"

shuttle_0 = rr #sliders shuttle button thing that rides in the track
    render: ->
        grad_0_z = shortid.generate()
        div null
            ,
            svg
                width: 400
                height: 200
                viewPort: '0 200 200 200'

                ,
                defs
                    linearGradient
                        id: grad_0_z
                        x1: "0%"
                        y1: "0%"
                        x2: "100%"
                        y2: "0%"
                        ,
                        stop
                            offset: "0%"
                            style:
                                stopColor:'rgb(0,255,255)'
                                stopOpacity:0.7
                        stop
                            offset: "100%"
                            style:
                                stopColor:'rgb(0,255,0)'
                                stopOpacity:0.6



                polygon
                    points: "60,20 100,40 100,80 60,100 20,80 20,40"
                    fill: 'lightgreen'

                circle
                    cx: 200
                    cy: 40
                    r: 10
                    #fill: 'url(../../static_assets/adom.jpg)'

                    fill: "url(##{grad_0_z})"



track_0 = rr # slider's track object
    render: ->
        div null
            ,
            svg
                width: 400
                height: 200
                viewPort: '0 0 200 200'
                ,
                path
                    d: "M 20 200 H 200"
                    stroke:'black'
                    strokeWidth: 3

slider_0 = rr #control
    render: ->
        div null,
            track_0()
            shuttle_0()
        # 

button_0 = rr # control surface
    render: ->
        div null, "button_0"

button_1 = rr #control surface
    render: ->
        div null, "button_1"

# there is really no need for these all to be in separate react classes.  maybe
# do the decomposition within svg world.
# or we could do both.  develop in individual react classes but then maybe 
# put them altogether under one svg.

range_dial_3 = rr
    render: ->
        div
            style:
                width: 300
                border: '2px solid white'
                borderRadius: 3

            ,
            slider_1
                range: @props.range
                rangeChange: @props.rangeChange
                raiseRange: @props.raiseRange
                lowerRange: @props.lowerRange
            button_1()
            button_0()



module.exports = -> range_dial_3
