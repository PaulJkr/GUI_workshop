{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, text} = React.DOM

c 'text', text

button_002 = rr
    colors: ['gold', 'green', 'silver', 'grey']

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

    getInitialState: ->
        c_0: @colors[0]
        c_1: @colors[1]
        c_2: @colors[2]

    render: ->
        svg
            width: '100%'
            height: '100%'
            ,
            defs
                radialGradient
                    id: 'radial__000'
                    ,
                    stop
                        offset: "50%"
                        stopColor: @state.c_0
                    stop
                        offset: "95%"
                        stopColor: @state.c_1
                    # stop
                    #     offset: "80%"
                    #     stopColor: @state.c_2
                filter
                    id: 'wald__000'
                    x: "10"
                    y: "10"
                    width: "100%"
                    height: "100%"
                    ,
                    feBlend
                        in: "FillPaint"
                        in2: "fillPaint"
                        mode: "screen"
            circle
                onClick: @handle_click
                cx: 50
                cy: 50
                r: 30
                fill: 'url(#radial__000)'
                #fill: "hsl(2222,90%,70%)"
                filter: 'url(#wald__000)'
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


module.exports = -> button_002