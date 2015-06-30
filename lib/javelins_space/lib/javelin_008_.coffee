{c, React, rr, shortid, assign, update, __react__root__} = require('../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

javelin = rr
    componentWillUpdate: ->
    displayName: ->
        "javelin 5"
    getDefaultProps: ->
        scalar_000: 1 # this isn't so helpful
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
        #@color_wheel_000()
    componentWillUnmount: ->
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
        {x, y} = @props ; s = @props.scalar_000

        triangle = [
            {x: 0, y: 50}
            {x: 50, y: -20}
            {x: -50, y: -20}
        ]

        # nicer than using svg's transform ?
        translate_triangle = (tri_arry) ->
            for i, idx in tri_arry
                {x: i.x + x, y: i.y + y}
        triangle_to_string = (tri_arry) ->
            tri_arry.reduce (acc, i) ->
                acc + "#{i.x},#{i.y} "
            , ""

        svg
            width: '100%'
            height: '100%'
            ,
            defs
                radialGradient
                    id: 'radial__003'
                    ,
                    stop
                        offset: @state.offset_1 + "%"
                        stopColor: "hsl(#{@state.color + 240},99%,80%)"
                    stop
                        offset: @state.offset_2 + "%"
                        stopColor: "hsl(#{@state.color + 120},99%,80%)"
                    stop
                        offset: @state.offset_3 + "%"
                        stopColor: "hsl(#{@state.color},99%,70%)"

            bale = [
                [0, 0]
                # [100 , 100]
                # [-100, -100]
                # [200, 200]
                # [200, 0]
                # [400, 0]
                # [-400, 200]
                # [-400, -300]
                # [-400, 0]
            ]


            for i, idx in bale
                polygon
                    fill: 'blue'
                    onClick: => @props.set_content_vector(@props.section, @props.cursor, 100)
                    points: triangle_to_string translate_triangle triangle
                    transform: "translate(#{i[0]}, #{i[1]})"





module.exports = -> javelin