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

        we have state 
        but also we have time
        time
        so with time we have setInterval and setTimeout, but we can also do new Date()
        and respond to times of day.  so if it's just turning 6am local time ? have to access geolocation metadata or something then you ask what they are having for healthy breakfast.  or whatever is more contextually appropriate.
         "


# i need to redesign state. on paper.  # TODO :: REFACTOR THIS opening gambit.

# perf addon & change data structures
# immutables should componentUpdate

    rad_to_deg: (rad) ->
        57.2957795 * rad

    random_luminal: ->

    random_saturation: ->

    random_hue: ->
        pi = Math.PI
        @rad_to_deg(Math.random() * 2 * pi)

    handle_click: (e) ->
        c "handdling"
        stub__00 =
            grad:
                stop_0: "hsl(0, 90%, 80% )"  #@colors[3]
                stop_1: "hsl(0, 90%, 80%)"  #@colors[2]
        c stub__00
        @setState


        stub =
            grad:
                stop_0: "hsl(#{@random_hue()}, 90%, 80% )"
                stop_1: "hsl(#{@random_hue()}, 90%, 70%)"
        setTimeout =>
            @setState
        , 500


    colors: ['gold', 'green', 'silver', 'grey']

    random_dance_000: ->
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
        , 50

    ordered_dance_000: ->
        # here we can use date to get milliseconds
        # or interval
        # state and time
        #
        # interval for animation but new Date to get timing ?
        start = new Date().getTime()

        setInterval =>
            now = new Date().getTime()
            delta = now - start
            delta /= 10
            object_x =
                position:
                    x: delta % 100
                    y: delta % 100
                    r: 20#(delta % 20) + 10
                grad :
                    stop_0: "hsl(#{@random_hue()},60%,70%)"
                    stop_1: "hsl(#{@random_hue()},90%,80%)"
            @setState
                happy: assign @state.happy, object_x
        , 1

    componentDidMount: ->
        #@random_dance_000()
        @ordered_dance_000()

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
            getting_text: off
            current_state : 'happy'

        assign object_3, states
        # object_0 =
        #     c_0: @colors[0]
        #     c_1: @colors[1]
        #     c_2: @colors[2]

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
                        offset: "#{Math.random() * 100}%"
                        stopColor: @state[@state.current_state].grad.stop_0
                    stop
                        offset: "#{Math.random() * 100}%"
                        stopColor: @state[@state.current_state].grad.stop_1

            circle
                onClick: @handle_click
                cx: @state[@state.current_state].position.x
                cy: @state[@state.current_state].position.y
                r: @state[@state.current_state].position.r
                fill: 'url(#radial__003)'

module.exports = -> button_003