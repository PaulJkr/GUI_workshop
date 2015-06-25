

{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

# require_dyn = require.context('./lib', true, /.coffee$/)

# basket = for i in require_dyn.keys()
#     require_dyn(i)()()

# basket_2 = require_dyn.keys().reduce (acc, i) ->
#     acc[i] = require_dyn(i)()
#     acc
# , {}



javelins = rr
    render: ->
        div null, "javelins"




module.exports = -> javelins