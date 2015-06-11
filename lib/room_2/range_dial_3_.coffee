module.exports = ->
    c = -> console.log.apply console, arguments
    React = require("react")
    PureRenderMixin = require('react/addons').addons.PureRenderMixin
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

# This dial has a slider control, two buttons. and an instrument dial which tells percentage state.
# The buttons should be classed eventually, but initially (avoiding premature optimisation) will be separate modules, and maybe approaches.  The buttons and the slider will be custom svg complexes, each go in separate files.  This file will just compose them into the whole range dial complex described above.

    rr
        render: ->
            div null,
                h1 {style:{color: 'white', fontFamily: 'sans-serif'}}, 'range dial 3'
