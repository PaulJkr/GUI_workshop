

{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

require_dyn = require.context('./lib', true, /.coffee$/)

# basket = for i in require_dyn.keys()
#     require_dyn(i)()()

basket_javelins = require_dyn.keys().reduce (acc, i) ->
    acc[i] = require_dyn(i)()
    acc
, {}

c basket_javelins



javelins_space = rr
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
                ,
                for key, value of basket_javelins
                    if typeof value is 'function'
                        value
                            section: @props.section
                            cell: key
                            set_content_vector: @props.set_content_vector

                            carte_x: "#{Math.random() * 100}%"
                            carte_y: "#{Math.random() * 100}%"








module.exports = -> javelins_space