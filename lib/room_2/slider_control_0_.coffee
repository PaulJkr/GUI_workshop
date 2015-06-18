
{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath} = React.DOM


slider_control = rr
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

module.exports = -> slider_control