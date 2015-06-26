{c, React, rr, shortid, assign, update, __react__root__} = require('../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

javelin = rr

    componentDidMount: ->
        #@color_wheel_000()

    getInitialState: ->
        color: Math.random() * 360

    color_wheel_000: ->
        start = new Date().getTime()
        setInterval =>
            now = new Date().getTime()
            delta = now - start
            @setState
                color: delta % 360
        , 10

    render: ->

        {x, y} = @props
        s = @props.scalar_000

        delta = 80 # ?


        svg
            width: '100%' # we don't need this wrapping svg but it may come in handy
            height: '100%' # for establishing new defs like gradients specific to this element
            ,
            defs
                radialGradient
                    id: 'radial__003'
                    ,
                    stop
                        offset: "22%"
                        stopColor: "hsl(#{@state.color + 120},99%,70%)"
                    stop
                        offset: "200%"
                        stopColor: "hsl(#{@state.color},99%,70%)"
            polygon
                fill: "url(#radial__003)"
                transform: "translate(#{x}, #{y})"
                points: "#{(-(delta/4) * s)},0 #{(delta/7) * s},#{(delta/4 *s)} #{(delta/7 * s)},#{(-(delta/4) * s)}"
        # rect
        #     x: @props.x - (5 * @props.scalar_000)
        #     y: @props.y - (5 * @props.scalar_000)
        #     width: 10 * @props.scalar_000
        #     height: 10 * @props.scalar_000
        #     fill: 'black'

module.exports = -> javelin