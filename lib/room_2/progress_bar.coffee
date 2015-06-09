module.exports = ->
    c = -> console.log.apply console, arguments
    React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a, input} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))


    style_alpha_position = (a) ->
        color: 'white'




    rr
        render: ->
            style = (a) ->
                position: 'absolute'
                zIndex: 70000
                width: 300
                height: 300
                background: 'lightgrey'
                border: '3px solid white'
                borderRadius: 300
                top: 200
                left: 300

            div # conttainer
                style: style()
