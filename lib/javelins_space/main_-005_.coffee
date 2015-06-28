

{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

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
            x_1 : s * 0
            y_1 : s * 20
            x_2 : s * 40
            y_2 : s * 40
            x_3 : s * 40
            y_3 : s * 20
            x_4 : s * 40
            y_4 : s * -20
            x_5 : s * 0
            y_5 : s * -40
            x_6: s * -40
            y_6: s * -20
        polygon
            onClick: -> c "yeah " + Math.random()
            stroke: 'black'
            fill: @props.color
            transform: "translate(#{@props.x}, #{@props.y})"
            points: "#{(60 * @props.scalar_000)},#{(20 * @props.scalar_000)} #{(100 * @props.scalar_000)},#{(40 * @props.scalar_000)} #{(100 * @props.scalar_000)},#{(80 * @props.scalar_000)} #{(60 * @props.scalar_000)},#{(100 * @props.scalar_000)} #{(20 * @props.scalar_000)}, #{(80 * @props.scalar_000)} #{20 * @props.scalar_000},#{(40 * @props.scalar_000)}"
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
    
    # componentDidMount: ->
    #     c "okaa here ?"
    #     bounding_rect = React.findDOMNode(@).getBoundingClientRect()
    #     c 'bounding rect', bounding rect
        # this does not work because this component hasn't got a dom node
        # it's just an svg.
        # we can pass this in as props , which would make more sense anyhow,
        # just to do the call once at some root node and propagate the data through
    shift_scalar_000: (e) ->

        @setState
            scalar_000: e.currentTarget.value
    getInitialState: ->

        scalar_000: 2.5

    aperiodic_tiling: ->

    hexagonal_tiling: ->

    componentDidMount: ->
        bounding_rect = React.findDOMNode(@).getBoundingClientRect()
        @setState
            bounding_rect: bounding_rect
    
    render: ->

        if not @state.bounding_rect
            c 'should get it'
            div
                style:
                    position: 'absolute'
                    width: '100%'
                    height: '100%'
                    background: 'grey'
                ,
                svg
                    width: '100%'
                    height: '100%'
                    ,
        else
            # original_hex_size = 80
            s = @state.scalar_000
            size_x = Math.floor(@state.bounding_rect.width / (s * 80))
            size_y = Math.floor(@state.bounding_rect.height / (s * 80))


            vW = @props.view_width
            vH = @props.view_height
            keys__ = Object.keys basket_javelins
            div
                style:
                    position: 'absolute'
                    width: '100%'
                    height: '100%'
                    background: 'grey'
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
                        for i in [0 .. (size_x - 1)]
                            cursor = keys__.pop()
                            elk = basket_javelins[cursor]
                            g
                                x: 0
                                ,
                                hexagon_cell
                                    scalar_000: @state.scalar_000
                                    color: "hsl(#{Math.random() * 360}, 99%, 70%)"
                                    x: if (j % 2 is 0) then (i * (80 * @state.scalar_000)) else (i * ((80 * @state.scalar_000)) + (40 * @state.scalar_000))
                                    y: j * (60 * @state.scalar_000)
                                    ,
                                if typeof elk is 'function'
                                    elk
                                        x: if (j % 2 is 0) then (i * (80 * @state.scalar_000) + (@state.scalar_000 * 60)) else (i * ((80 * @state.scalar_000)) + (40 * @state.scalar_000) + (@state.scalar_000 * 60))
                                        y: j * (60 * @state.scalar_000) + (@state.scalar_000 * 60)
                                        scalar_000: @state.scalar_000
                                        ,







module.exports = -> javelins_space







                # rect
                #     #vectorEffect: "non-scaling-stroke"
                #     x: 200
                #     y: 200
                #     width:200
                #     height: 200
                #     stroke:"green"
                #     strokeWidth: 1
                #     fill:"yellow"
                #     filter:"url(#f1)"

