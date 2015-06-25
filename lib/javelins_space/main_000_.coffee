

{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

require_dyn = require.context('./lib', true, /.coffee$/)

# basket = for i in require_dyn.keys()
#     require_dyn(i)()()

basket_javelins = require_dyn.keys().reduce (acc, i) ->
    acc[i] = require_dyn(i)()
    acc
, {}


hexagon_cell = rr
    render: ->
        polygon
            vectorEffect: "non-scaling-stroke"
            fill: 'none'
            stroke: 'black'
            #transform: "translate(100, 300)"
            points: "100, 20  90,40 30, 80"





javelins_space = rr

    getInitialState: ->
        hello : 'hi'

    aperiodic_tiling: ->

    hexagonal_tiling: ->
    
    render: ->
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
                # viewBox: "0 0 100 100"
                # preserveAspectRatio: "none"
                ,
                # for key, value of basket_javelins
                #     if typeof value is 'function'
                #         value
                #             section: @props.section
                #             cell: key
                #             set_content_vector: @props.set_content_vector

                #             carte_x: "#{Math.random() * 100}%"
                #             carte_y: "#{Math.random() * 100}%"
                #hexagon_cell()
                defs
                    filter
                        id:"f1"
                        x:0
                        y:0
                        ,
                        feGaussianBlur
                            in:"SourceGraphic"
                            stdDeviation:"15"
                    # filter
                    #     id:"f2"
                    #     x:"0"
                    #     y:"0"
                    #     width:"200%"
                    #     height:"200%"
                    #     ,
                    #     feOffset result:"offOut"
                    #     in:"SourceGraphic"
                    #     dx:"20"
                    #     dy:"20"
                    #     ,
                    #     feGaussianBlur
                    #         result:"blurOut"
                    #         in:"offOut"
                    #         stdDeviation:"10"
                    #         ,
                    #     feBlend
                    #         in:"SourceGraphic"
                    #         #in2:"blurOut"
                    #         mode:"normal"
                    #         ,

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