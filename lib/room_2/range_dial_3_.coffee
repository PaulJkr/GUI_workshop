
c = -> console.log.apply console, arguments
React = require("react")
PureRenderMixin = require('react/addons').addons.PureRenderMixin
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require('shortid')

# This dial has a slider control, two buttons. and an instrument dial which tells percentage state.
# The buttons should be classed eventually, but initially (avoiding premature optimisation) will be separate modules, and maybe approaches.  The buttons and the slider will be custom svg complexes, ~~each go in separate files~~.  This file will just compose them into the whole range dial complex described above..

shuttle_0 = rr #sliders shuttle button thing that rides in the track
    render: ->
        grad_0_z = shortid.generate()
        div
            style:
                position: 'absolute'
                left: 300
                top: 0
            ,
            "shuttle_0"
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



                polygon
                    points: "60,20 100,40 100,80 60,100 20,80 20,40"

                circle
                    cx: 200
                    cy: 40
                    r: 30
                    #fill: 'url(../../static_assets/adom.jpg)'
                    color: 'red'
                    stroke: 'red'
                    fill: "url(##{grad_0_z})"



track_0 = rr # slider's track object
    render: ->
        div null, "track_0"

slider_0 = rr #control
    render: ->
        div null,
            "slider_0"
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
        div null,
            slider_0()
            button_1()
            button_0()



module.exports = -> range_dial_3
