{c, React, rr, shortid, assign, update, __react__root__} = require('../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

javelin = rr

    componentWillUnmount: ->
        clearInterval @interval_000


    componentDidMount: ->
        @color_wheel_000()

    getInitialState: ->
        color: Math.random() * 360

    color_wheel_000: ->
        color_shift_velocity = .10
        start = new Date().getTime()
        @interval_000 = setInterval =>
            now = new Date().getTime()
            delta = (now - start) * color_shift_velocity
            @setState
                color: delta % 360
        , 20

    render: ->

        {x, y} = @props
        s = @props.scalar_000

        delta = 80 # ?

        hexagon_points_map = 
            x_1 : s * -40
            y_1 : s * 20
            x_2 : s * 0
            y_2 : s * 40
            x_3 : s * 40
            y_3 : s * 20
            x_4 : s * 40
            y_4 : s * -20
            x_5 : s * 0
            y_5 : s * -40
            x_6: s * -40
            y_6: s * -20

        {x_1, y_1, x_2, y_2, x_3, y_3, x_4, y_4, x_5, y_5, x_6, y_6} = hexagon_points_map


        svg
            width: '100%'
            height: '100%'
            ,
            defs
                radialGradient
                    id: 'radial__003'
                    ,
                    stop
                        offset: "10%"
                        stopColor: "hsl(#{@state.color + 240},99%,80%)"
                    stop
                        offset: "30%"
                        stopColor: "hsl(#{@state.color + 120},99%,80%)"
                    stop
                        offset: "180%"
                        stopColor: "hsl(#{@state.color},99%,70%)"
            # polygon
            #     fill: "url(#radial__003)"
            #     transform: "translate(#{x}, #{y})"
            #     points: "#{(-(delta/4) * s)},0 #{(delta/7) * s},#{(delta/4 *s)} #{(delta/7 * s)},#{(-(delta/4) * s)}"
            polygon
                fill: 'url(#radial__003)'
                #transform: "translate(#{x}, #{y})"
                points: "#{x_1 + x},#{y_1 + y} #{x_2 + x},#{y_2 + y} #{x_3 + x},#{y_3 + y} #{x_4 + x},#{y_4 + y} #{x_5 + x},#{y_5 + y} #{x_6 + x},#{y_6 + y}"
        # rect
        #     x: @props.x - (5 * @props.scalar_000)
        #     y: @props.y - (5 * @props.scalar_000)
        #     width: 10 * @props.scalar_000
        #     height: 10 * @props.scalar_000
        #     fill: 'black'

module.exports = -> javelin