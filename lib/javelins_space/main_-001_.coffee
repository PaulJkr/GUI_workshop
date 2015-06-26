

{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

require_dyn = require.context('./lib', true, /.coffee$/)

# basket = for i in require_dyn.keys()
#     require_dyn(i)()()

# basket_javelins = require_dyn.keys().reduce (acc, i) ->
#     acc[i] = require_dyn(i)()
#     acc
# , {}


hexagon_cell = rr
    render: ->
        polygon
            onClick: -> c "yeah " + Math.random()
            # vectorEffect: "non-scaling-stroke"
            filter: 'url(#f2)'
            # x: 300
            # y: 50
            stroke: 'black'
            fill: @props.color
            transform: "translate(#{@props.x}, #{@props.y})"
            points: "60,20 100,40 100,80 60,100 20,80 20,40"





javelins_space = rr
    
    # componentDidMount: ->
    #     c "okaa here ?"
    #     bounding_rect = React.findDOMNode(@).getBoundingClientRect()
    #     c 'bounding rect', bounding rect
        # this does not work because this component hasn't got a dom node
        # it's just an svg.
        # we can pass this in as props , which would make more sense anyhow,
        # just to do the call once at some root node and propagate the data through

    getInitialState: ->
        hello : 'hi'

    aperiodic_tiling: ->

    hexagonal_tiling: ->
    
    render: ->
        vW = @props.view_width
        vH = @props.view_height
        c vW, vH, "vW and vH"
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
                hexagon_cell
                    x: 400
                    y: 200
                for i in [0 .. 10]
                    hexagon_cell
                        color: "hsl(#{Math.random() * 360},99%,70%)"
                        x: i * 80
                        y: 100
                for i in [0 .. 10]
                    hexagon_cell
                        color: "hsl(#{Math.random() * 360},99%,70%)"
                        x: (i * 80) + 40
                        y: 160
                g
                    #transform: "translate(200, 50)"
                    x: "400px"
                    y: "200px"
                    ,
                    circle
                        cx: 100
                        cy: 100
                        r: 40


                rect
                    #vectorEffect: "non-scaling-stroke"
                    x: 200
                    y: 200
                    width:200
                    height: 200
                    stroke:"green"
                    strokeWidth: 1
                    fill:"yellow"
                    filter:"url(#f1)"









module.exports = -> javelins_space