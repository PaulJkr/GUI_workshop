module.exports = ->
    c = -> console.log.apply console, arguments
    React = require("react")
    PureRenderMixin = require('react/addons').addons.PureRenderMixin
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

    rr
        render: ->
            div
                style:
                    background: 'lightgrey'
                    border: '1px solid white'
                    borderRadius: 4
                ,
                span
                    onClick: @props.lowerRange
                    style:
                        zIndex: 700000
                        cursor: 'pointer'
                        #position: 'absolute'
                        background: 'lightgrey'
                        border: '1px solid white'
                        padding: 4
                        borderRadius: 10
                        #left: 680
                    ,
                    "<-"
                input
                    type: 'range'
                    onChange: @props.rangeChange
                    value: @props.range
                    step: 1
                    style:
                        #position: 'absolute'
                        #left: @props.width + 300

                        width: 200
                    ,
                span
                    onClick: @props.raiseRange
                    style:
                        cursor: 'pointer'
                        #position: 'absolute'
                        background: 'lightgrey'
                        border: '1px solid white'
                        padding: 4
                        borderRadius: 10
                        #left: 930
                    ,
                    "->"
                span
                    style:
                        #position: 'absolute'
                        #left: 600
                        #top: 100
                        fontSize: 23
                        color: 'white'
                    ,
                    @props.range + "%"