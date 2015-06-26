

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
        g
            x: 0
            ,
            polygon
                onClick: -> c "yeah " + Math.random()
                # vectorEffect: "non-scaling-stroke"
                #filter: 'url(#f2)'
                # x: 300
                # y: 50
                stroke: 'black'
                fill: @props.color
                transform: "translate(#{@props.x}, #{@props.y})"
                points: "#{(60 * @props.scalar_000)},#{(20 * @props.scalar_000)} #{(100 * @props.scalar_000)},#{(40 * @props.scalar_000)} #{(100 * @props.scalar_000)},#{(80 * @props.scalar_000)} #{(60 * @props.scalar_000)},#{(100 * @props.scalar_000)} #{(20 * @props.scalar_000)}, #{(80 * @props.scalar_000)} #{20 * @props.scalar_000},#{(40 * @props.scalar_000)}"
                ,
            # circle
            #     transform: "translate(#{@props.x}, #{@props.y})"
            #     cx: (60 * @props.scalar_000)
            #     cy: (60 * @props.scalar_000)
            #     r: 10 * @props.scalar_000



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
        hello : 'hi'
        scalar_000: 4

    aperiodic_tiling: ->

    hexagonal_tiling: ->
    
    render: ->
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
                # viewBox: "0 0 100 100"
                # preserveAspectRatio: "none"

                # for key, value of basket_javelins
                #     if typeof value is 'function'
                #         value
                #             section: @props.section
                #             cell: key
                #             set_content_vector: @props.set_content_vector

                #             carte_x: "#{Math.random() * 100}%"
                #             carte_y: "#{Math.random() * 100}%"

                #for i in [0 .. 10]

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
                for j in [0 .. 9]
                    for i in [0 .. 10]
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

