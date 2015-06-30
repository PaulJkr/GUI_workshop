{c, React, rr, shortid, assign, update, __react__root__} = require('../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

p0 = shortid.generate()
p1 = shortid.generate()
p2 = shortid.generate()

javelin = rr

    triangle_modify: (a) ->
        c 'in triangle modify'
        p = a.point_address # one of those shortids on @point_1 eg
        coord = a.coord
        val = a.value
        @setState
            "#{p}:#{coord}": val


#---------------------------------------------
# triangle = [
#     {x: 0, y: -40}
#     {x: -20, y: -258}
#     {x: 5, y: -258}
# ]
    more_initial_state: -> # (add this to get_initial_state)
        "#{p0}:0": 0
        "#{p0}:1": -100 # something like that
        "#{p1}:0": -20
        "#{p1}:1": -150
        "#{p2}:0": 5
        "#{p2}:1": -150
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
        Object.assign @more_initial_state(),
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

        # triangle = [
        #     {x: 0, y: -40}
        #     {x: -20, y: -258}
        #     {x: 5, y: -258}
        # ]

        triangle = [
            {x: @state["#{p0}:0"], y: @state["#{p0}:1"]}
            {x: @state["#{p1}:0"], y: @state["#{p1}:1"]}
            {x: @state["#{p2}:0"], y: @state["#{p2}:1"]}
        ]

        # nicer than using svg's transform ?
        scale_triangle = (tri_arry) ->
            for i, idx in tri_arry
                {x: i.x * s, y: i.y *s}
        translate_triangle = (tri_arry) ->
            for i, idx in tri_arry
                {x: i.x + x, y: i.y + y}
        triangle_to_string = (tri_arry) ->
            tri_arry.reduce (acc, i) ->
                #c 'i.y', i.y
                nu_y = -(parseInt(i.y)/2)
                #c 'nu_y', nu_y
                acc + "#{i.x},#{nu_y} "
            , ""

        bluefin = [
            [10, 20]
            [0, 0]
        ]

        arry_up_to_object = (arry)->
            {x: arry[0], y: arry[1]}

        transforms = for i, idx in bluefin
            arry_up_to_object i

        transforms_old = [
            # {x: 10, y: 20}
            {x: 0, y: 0}
        ]

        scale_transforms = (trans_arry) ->
            for i, idx in trans_arry
                {x: i.x * s, y: i.y * s}

        scaled_transforms = scale_transforms transforms

        strang2 = triangle_to_string translate_triangle triangle
        #c 'strang2', strang2
        strang = triangle_to_string translate_triangle(scale_triangle(triangle))
        bare_svg = =>
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
                for i, idx in scaled_transforms
                    polygon
                        onClick: => @props.set_content_vector(@props.section, @props.cursor, 100)
                        #fill: 'url(#radial__003)'
                        #transform: "translate(#{i.x}, #{i.y})"
                        points: strang
        #bare_svg()
        total_recall = =>
            div
                style:
                    position: 'absolute'
                    width: '100%'
                    height: '100%'
                ,
                input
                    style:
                        position: 'absolute'
                        top: 50
                        left: 10
                    value: @state["#{p0}:0"]
                    type: 'number'
                div
                    style:
                        position: 'absolute'
                        top: 20
                        left: 10
                    ,
                    input
                        type: 'range'
                        value: @state["#{p0}:0"]
                        min: -40
                        max: 40
                        onChange:(e) =>
                            @triangle_modify
                                point_address: p0
                                coord: 0 # 0 and 1 ::: x and y
                                value: e.currentTarget.value
                    span
                        style:
                            position: 'absolute'
                        ,
                        @state["#{p0}:0"]
                div
                    style:
                        position: 'absolute'
                        top: 80
                        left: 10
                    ,
                    input
                        type: 'range'
                        value: @state["#{p0}:1"]
                        min: -200
                        max: 100
                        onChange:(e) =>
                            @triangle_modify
                                point_address: p0
                                coord: 1 # 0 and 1 ::: x and y
                                value: e.currentTarget.value
                        ,
                    span
                        style:
                            position: 'absolute'
                        ,
                        #@state["#{p0}:1"]
                        @state["#{p0}:1"]


                bare_svg()
        if @props.from_root is on
            total_recall()
        else
            bare_svg()




module.exports = -> javelin