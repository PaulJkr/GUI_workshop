
{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath} = React.DOM


range_dial = rr
    render: ->
        div
            style:
                position: 'absolute'
                left: width + 10
                top: 0
                background: 'lightgrey'
                border: '1px solid white'
                borderRadius: 4
            ,
            span
                onClick: @lowerRange
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
                onChange: @rangeChange
                value: @state.range
                step: 1
                style:
                    #position: 'absolute'
                    #left: @props.width + 300

                    width: 200
                ,
            span
                onClick: @raiseRange
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
                @state.range + "%"

module.exports = -> range_dial