


c = -> console.log.apply console, arguments
React = require("react")
{p, div, h1, h2, h3, h4, h5, h6, span, svg, defs, linearGradient, circle, stop, ul, li, ol, code, a, input} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require 'shortid'


room_3_main = rr

    render: ->
        div null, 'room_3'


module.exports = -> room_3_main