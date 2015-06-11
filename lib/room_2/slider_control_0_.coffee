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
                        position: 'absolute'
                        top: 5
                        left: 210
                    ,
                    svg null
                        # width: 20
                        # height: 20
                        ,
                        circle
                            onClick: @props.raiseRange
                            cx: 10
                            cy: 10
                            r: 10
                            fill: 'red'