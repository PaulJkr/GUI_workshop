{c, React, rr, shortid, assign, update, __react__root__} = require('../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM


test_func_1 = rr
    render: ->
        circle
            cx: @props.bounding_rect.width / 2
            cy: @props.bounding_rect.height / 2
            r: @props.bounding_rect.height / 2
            fill: 'url(#radial__003)'

javelin = rr

    change_input_1: (e) ->
        @setState
            offset_1: e.currentTarget.value
    change_input_2: (e) ->
        @setState
            offset_2: e.currentTarget.value
    change_input_3: (e) ->
        @setState
            offset_3: e.currentTarget.value
    componentDidMount: ->
        @color_wheel_000()

        @setState
            bounding_rect: React.findDOMNode(@).getBoundingClientRect()

        window.addEventListener "resize", =>
            @setState
                bounding_rect: React.findDOMNode(@).getBoundingClientRect()

    getInitialState: ->
        color: Math.random() * 360
        offset_1: 10
        offset_2: 40
        offset_3: 180

    color_wheel_000: ->
        color_shift_velocity = .10
        start = new Date().getTime()
        setInterval =>
            now = new Date().getTime()
            delta = (now - start) * color_shift_velocity
            @setState
                color: delta % 360
        , 20

    render: ->
        test_func_2 = =>
            circle
                cx: @state.bounding_rect?.width / 2
                cy: @state.bounding_rect?.height / 2
                r: @state.bounding_rect?.height / 2
                fill: 'url(#radial__003)'

        test_func_4 = =>


        test_func_3 = =>
            s = (@state.bounding_rect?.width / 160)
            x = @state.bounding_rect?.width / 2
            y = @state.bounding_rect?.height / 2

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

            div
                style:
                    position: 'absolute'
                    width: '100%'
                    height: '100%'
                    top: '0%'
                    left: '0%'
                ,
                div
                    style:
                        position: 'absolute'
                        width: '10%'
                        height: '30%'
                        top: '40%'
                        right: "10%"
                    ,
                    div
                        style:
                            position: 'absolute'
                            width: '100%'
                            height: '100%'
                            background: 'blue'
                            opacity: 0.4
                        ,
                    div
                        style:
                            position: 'absolute'
                        ,
                        input
                            value: @state.offset_1
                            type: 'range'
                            min: 0
                            max: 300
                            onChange: @change_input_1
                        input
                            value: @state.offset_2
                            type: 'range'
                            min: 0
                            max: 300
                            onChange: @change_input_2
                        input
                            value: @state.offset_3
                            type: 'range'
                            min: 0
                            max: 300
                            onChange: @change_input_3
                svg
                    width: '100%'
                    height: '100%'
                    ,
                    defs
                        radialGradient
                            id: 'radial__003'
                            ,
                            stop
                                offset: "#{@state.offset_1}%"
                                stopColor: "hsl(#{@state.color + 240},99%,80%)"
                            stop
                                offset: "#{@state.offset_2}%"
                                stopColor: "hsl(#{@state.color + 120},99%,80%)"
                            stop
                                offset: "#{@state.offset_3}%"
                                stopColor: "hsl(#{@state.color},99%,70%)"

                    test_func_2()

        test_func_4 = (a) ->

            s = "we must define from a"
            # but these could all be polymorphed on state
            # with componentDidMount and compponentWillMount
            # maybe getInitialState.
            # then there would be no function here taking args
            # there would be just one function adapting to state.
            # todo : put the window event handler functions into
            # definitions so they can be more easily removed by name.
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

                polygon
                    onClick: => @props.set_content_vector(@props.section, @props.cursor)
                    fill: 'url(#radial__003)'
                    #transform: "translate(#{x}, #{y})"
                    points: "#{x_1 + x},#{y_1 + y} #{x_2 + x},#{y_2 + y} #{x_3 + x},#{y_3 + y} #{x_4 + x},#{y_4 + y} #{x_5 + x},#{y_5 + y} #{x_6 + x},#{y_6 + y}"

        if not @props.scalar_000
            if not @state.bounding_rect
                svg
                    width: '100%' # we don't need this wrapping svg but it may come in handy
                    height: '100%' # for establishing new defs like gradients specific to this element
                    ,
            else
                c 'here', test_func_1
                test_func_3()


        else
            c "hi"
            {x, y} = @props
            s = @props.scalar_000

            s *= .67

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

                polygon
                    onClick: => @props.set_content_vector(@props.section, @props.cursor)
                    fill: 'url(#radial__003)'
                    #transform: "translate(#{x}, #{y})"
                    points: "#{x_1 + x},#{y_1 + y} #{x_2 + x},#{y_2 + y} #{x_3 + x},#{y_3 + y} #{x_4 + x},#{y_4 + y} #{x_5 + x},#{y_5 + y} #{x_6 + x},#{y_6 + y}"







module.exports = -> javelin