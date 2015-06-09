

module.exports = ->
    c = -> console.log.apply console, arguments
    React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a, input} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

    progress_bar = require('./progress_bar.coffee')()

    style = (a) ->
        width: 1000
        height: 600
        background: 'lightblue'

    rr
        
        render: ->
            div
                style: style()
                ,
                h3 {color: 'red'}, "yes"
                progress_bar()