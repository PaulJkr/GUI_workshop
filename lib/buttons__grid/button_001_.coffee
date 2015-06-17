
c = -> console.log.apply console, arguments
#React = require("react")
PureRenderMixin = require('react/addons').addons.PureRenderMixin
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require('shortid')


button_000 = rr

    claque: (e) ->
        @setState
            color: 'white'
        setTimeout =>
            @setState
                color: 'blue'
        , 200

    getInitialState: ->
        color: 'blue'

    render: ->
        svg
            width: '100%'
            height: '100%'
            ,
            circle
                onClick: @claque
                cx: 50
                cy: 50
                r: 30
                fill: @state.color


module.exports = -> button_000