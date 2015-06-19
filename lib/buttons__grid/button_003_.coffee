{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, text} = React.DOM

button_003 = rr

    __specification__:
        readme: "this is button_3, it's going to be 2 dimensional and not try to pretend to be a 3d 
        model button.  not gooing to try to mimic that.  working with different sense. lots of state
        there is lot's of state
        so for example


        they can push it for it to go into a state.  and when they ignore it it starts
        doing other behaviours like flashing on and off.


         "

    rad_to_deg: (rad) ->
        57.2957795 * rad

    random_luminal: ->

    random_saturation: ->

    random_hue: ->
        pi = Math.PI
        @rad_to_deg(Math.random() * 2 * pi)

    handle_click: (e) ->
        @setState
            c_0: "hsl(#{@random_hue()}, 90%, 70%)"  #@colors[2]
            c_1: "hsl(#{@random_hue()}, 90%, 80% )"  #@colors[3]

        setTimeout =>
            @setState
                c_0: @colors[0]
                c_1: @colors[1]
        , 500


    colors: ['gold', 'green', 'silver', 'grey']

    componentDidMount: ->
        setInterval =>
            object_x = 
                position:
                    x: Math.floor(Math.random() * 80) + 10
                    y: Math.floor(Math.random() * 80) + 10
                    r: Math.floor(Math.random() * 24) + 10
                grad :
                    stop_0: "hsl(#{@random_hue()},60%,70%)"
                    stop_1: "hsl(#{@random_hue()},90%,80%)"
            @setState
                happy: assign @state.happy, object_x
        , 1000
    getInitialState: ->

        states =
            happy:
                position:
                    x: Math.floor(Math.random() * 50) + 40
                    y: Math.floor(Math.random() * 50) + 40
                    r: Math.floor(Math.random() * 24) + 10
                grad:
                    stop_0: "hsl(#{@random_hue()},60%,70%)"
                    stop_1: "hsl(#{@random_hue()},90%,80%)"
                grad_1:
                    stop_0: "hsl(#{@random_hue()},60%,70%)"
                    stop_1: "hsl(#{@random_hue()},90%,80%)"
            excited:
                grad:
                    stop_0: "hsl(#{@random_hue()},60%,70%)"
                    stop_1: "hsl(#{@random_hue()},90%,80%)"
            # ignored:
            #     grad:
            #         stop_0: "hsl(#{random_hue},60%,70%)"
            #         stop_1: "hsl(#{random_hue},90%,80%)"
            # sad:
            #     grad:
            #         stop_0: "hsl(#{random_hue},60%,70%)"
            #         stop_1: "hsl(#{random_hue},90%,80%)"
            # clicked:
            #     grad:
            #         stop_0: "hsl(#{random_hue},60%,70%)"
            #         stop_1: "hsl(#{random_hue},90%,80%)"
            # moused_over:
            #     grad:
            #         stop_0: "hsl(#{random_hue},60%,70%)"
            #         stop_1: "hsl(#{random_hue},90%,80%)"


        object_3 = 
            current_state : 'happy'

        assign object_3, states
        object_0 =
            c_0: @colors[0]
            c_1: @colors[1]
            c_2: @colors[2]

        return object_3

    render: ->
        svg
            width: '100%'
            height: '100%'
            ,
            defs
                radialGradient
                    id: 'radial__003'
                    ,
                    stop
                        offset: "50%"
                        stopColor: @state[@state.current_state].grad.stop_0
                    stop
                        offset: "95%"
                        stopColor: @state[@state.current_state].grad.stop_1
                # filter
                #     id: 'wald__000'
                #     x: "10"
                #     y: "10"
                #     width: "100%"
                #     height: "100%"
                #     ,
                #     feBlend
                #         in: "FillPaint"
                #         in2: "fillPaint"
                #         mode: "screen"
            circle
                onClick: @handle_click
                cx: @state[@state.current_state].position.x
                cy: @state[@state.current_state].position.y
                r: @state[@state.current_state].position.r
                fill: 'url(#radial__003)'
                #filter: 'url(#wald__000)'
            text
                x: 10
                y: 20
                style:
                    fontFamily: 'Verdana'
                    fontSize: 10
                    #stroke: 'green'
                    #fill: 'blue'
                ,
                "Hello there"


module.exports = -> button_003