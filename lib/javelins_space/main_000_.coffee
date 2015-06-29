{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{alert, prompt, p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

# { here import some components , for doing like adhoc controllers, stuff like custom sliders , that stuff could be in lib root or something.}

require_dyn = require.context('./lib', true, /.coffee$/)

basket_javelins = require_dyn.keys().reduce (acc, i) ->
    acc[i] = require_dyn(i)()
    acc
, {}

hexagon_cell = rr

    render: ->
        s = @props.scalar_000
        {x, y} = @props
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
        polygon
            stroke: 'black'
            fill: @props.color
            transform: "translate(#{@props.x}, #{@props.y})"
            points: "#{x_1},#{y_1} #{x_2},#{y_2} #{x_3},#{y_3} #{x_4},#{y_4} #{x_5},#{y_5} #{x_6},#{y_6}"
            ,


adhoc_controller = rr
    render: ->
        div
            style:
                position: 'fixed'
                right: 0
                top: 100
                width: 70
                height: 100
            ,
            div
                style:
                    position: 'absolute'
                    width: '100%'
                    height: '100%'
                    background: 'purple'
                    opacity: .4
            div
                style:
                    position: 'absolute'
                ,
                input
                    value: @props.scalar_000
                    type: 'range'
                    step: .1
                    min: .1
                    max: 10
                    onChange: @props.shift_scalar_000

javelins_space = rr
    shift_scalar_000: (e) ->
        @setState
            scalar_000: e.currentTarget.value

    getInitialState: ->
        scalar_000: 2.5

    aperiodic_tiling: ->

    componentDidMount: ->

    
    render: ->
        s = @state.scalar_000
        size_x = Math.floor(@props.view_width / (s * 80))
        size_y = 1 + Math.floor((@props.view_height - (s * 80)) / (s * 60))

        vW = @props.view_width # redundant with above note
        vH = @props.view_height

        keys__ = Object.keys basket_javelins
        div
            style:
                position: 'absolute'
                width: '100%'
                height: '100%'
                background: 'white'
                #pointerEvents: 'none'
            ,
            adhoc_controller
                scalar_000: @state.scalar_000
                shift_scalar_000: @shift_scalar_000
            svg
                width: '100%'
                height: '100%'
                ,
                defs
                    filter
                        id:"f1"
                        x:0
                        y:0
                        ,
                        feGaussianBlur
                            in:"SourceGraphic"
                            stdDeviation:"15"
                    filter
                        id:"f2"
                        x:"-10"
                        y:"-10"
                        width:300
                        height:300
                        ,
                        feOffset result:"offOut"
                        in:"SourceGraphic"
                        dx:"9"
                        dy:"9"
                        ,
                        feGaussianBlur
                            result:"blurOut"
                            in:"offOut"
                            stdDeviation:".8"
                            ,
                        feBlend
                            in:"SourceGraphic"
                            #in2:"blurOut"
                            mode:"normal"
                            ,
                for j in [0 .. (size_y - 1)]
                    if (j % 2) is 0 then limit_x = (size_x - 1) else limit_x = (size_x - 2)
                    for i in [0 .. (limit_x)]
                        cursor = keys__.pop()
                        elk = basket_javelins[cursor]
                        g
                            x: 0
                            ,
                            hexagon_cell
                                scalar_000: @state.scalar_000
                                color: "hsl(#{Math.random() * 360}, 99%, 70%)"
                                x: if j % 2 is 0 then ((i * (80 * s)) + (s * 40)) else ((i * (80 * s)) + (s * 80))
                                y: (j * (60 * s)) + (s * 40)
                                ,
                            if typeof elk is 'function'
                                elk
                                    x: if j % 2 is 0 then ((i * (80 * s)) + (s * 40)) else ((i * (80 * s)) + (s * 80))
                                    y: (j * (60 * s)) + (s * 40)
                                    scalar_000: @state.scalar_000
                                    set_content_vector: @props.set_content_vector
                                    cursor: cursor
                                    cell: cursor
                                    section: @props.section
                                ,


module.exports = -> javelins_space
