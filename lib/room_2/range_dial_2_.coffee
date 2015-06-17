module.exports = ->
    c = -> console.log.apply console, arguments
    #React = require("react")
    PureRenderMixin = require('react/addons').addons.PureRenderMixin
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

# the goal here ultimately is to rewrite this whole composite element as an svg.  even and especially the input slider.

    rr
        render: ->
            div
                style:
                    height: 60
                    background: 'lightgrey'
                    border: '1px solid white'
                    borderRadius: 4
                    width: 260
                ,
                div
                    onClick: @props.lowerRange
                    style:
                        cursor: 'pointer'
                        position: 'absolute'
                        top: 10
                        left: 10
                        background: 'lightgrey'
                        border: '1px solid white'
                        borderRadius: 10
                    ,
                    "<-"
                input
                    type: 'range'
                    onChange: @props.rangeChange
                    value: @props.range
                    step: 1
                    style:
                        position: 'absolute'
                        left: 20
                        height: 20
                        width: 160
                    ,
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
                # div
                #     style:
                #         position: 'absolute'
                #         top: 300

                #         left: 300
                #         height: 40
                #         width: 40
                #         background: 'white'
                #         border: '2px solid black'
                #         borderRadius: '4px'
                    ,
                    # div
                    #     onClick: @props.raiseRange
                    #     style:
                    #         cursor: 'pointer'
                    #         position: 'absolute'
                    #         left: '38%'
                    #         top: '33%'
                    #         background: 'lightgrey'
                    #         border: '1px solid white'
                    #         borderRadius: 10
                    #     ,
                    #     "->"

                div
                    style:
                        position: 'absolute'
                        right: 130
                        bottom: 10
                        fontSize: 17
                        color: 'white'
                    ,
                    @props.range + "%"