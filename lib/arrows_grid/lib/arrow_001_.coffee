
{c, React, rr, shortid, assign, update, __react__root__} = require('../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

arrow = rr

    getInitialState: ->
        arrow_stroke: 'red'


    shuffle_stroke: ->
        start = new Date().getTime()
        interval_000 = setInterval =>
            now = new Date().getTime()
            scaling_factor = .10
            delta = start - now
            delta *= scaling_factor
            @setState
                arrow_stroke: "hsl(#{delta % 360}, 99%, 77%)"
        , 1

    componentDidMount: ->
        rect = React.findDOMNode(@).getBoundingClientRect()
        @setState
            rect_width: rect.width
            rect_height: rect.height
        @shuffle_stroke()


    render: ->
        svg
            width: '100%'
            height: '100%'
            ,
            g
                path
                    stroke: @state.arrow_stroke
                    strokeWidth: 10
                    d: "M #{rect.width * .3} #{rect.height / 2} H #{rect.width * .75}"
                path
                    d: "M #{rect.width / 2} #{rect.height / 2} L #{rect.width * .3} #{rect.height * .65}"
                    stroke: @state.arrow_stroke
                    strokeWidth: 3
                path
                    d: "M #{rect.width / 2} #{rect.height / 2} L #{rect.width * .3} #{rect.height * .35}"
                    stroke: @state.arrow_stroke
                    strokeWidth: 3
                path
                    d: "M #{rect.width * .75} #{rect.height / 2} L #{rect.width * .55} #{rect.height * .65}"
                    stroke: @state.arrow_stroke
                    strokeWidth: 10
                path
                    d: "M #{rect.width * .75} #{rect.height / 2} L #{rect.width * .55} #{rect.height * .35}"
                    stroke: @state.arrow_stroke
                    strokeWidth: 10


module.exports = -> arrow