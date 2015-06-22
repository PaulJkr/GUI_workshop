

{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, pattern} = React.DOM

ph_glyph_000 = rr

    changeMode: (e) ->
        interval = 1
        start = new Date().getTime() #* interval
        interval_0 = setInterval =>
            now = new Date().getTime() #* interval
            delta = (now - start) / 5 #* interval
            # if delta % 1000 is 0
            #     c Math.random()
            if delta < 500
                @setState
                    mode: (delta % 360 )
            else
                clearInterval interval_0
                @setState
                    mode: 0
        , interval


    getInitialState: ->
        mode: 0

    render: ->
        div
            style:
                position: 'absolute'
                width: "100%"
                height: "100%"
                #background: 'red'
                ,
            svg
                width: '100%'
                height: '100%'
                ,
                defs
                    radialGradient
                        id: 'radial__005'
                        ,
                        stop
                            offset: "73%"
                            stopColor: "hsl(#{@state.mode}, 100%, 60%)"
                        stop
                            offset: "93%"
                            stopColor: "gold"
                    filter
                        id: 'wald'
                        ,
                        feGaussianBlur
                            in: "SourceGraphic"
                            stdDeviation: 5

                    pattern
                        id: 'img_1'
                        patternUnits: 'userSpaceOnUse'
                        width: '100%'
                        height: '100%'
                        ,
                        image
                            xlinkHref: "../../static_assets/adom.jpg"
                            x: "-10%"
                            y: "-20%"
                            width: '100%'
                            height: '100%'
                    pattern
                        id: 'img_2'
                        patternUnits: 'userSpaceOnUse'
                        width: '120%'
                        height: '100%'
                        ,
                        image
                            xlinkHref: "../../static_assets/adom.jpg"
                            x: "-50%"
                            y: "3%"
                            width: '200%'
                            height: '130%'
                # circle
                #     cx: 30
                #     cy: 20
                #     r: 500
                #     fill: "url(#img_1)"
                #     ,
                circle
                    onClick: @changeMode
                    cx: "50%"
                    cy: "50%"
                    r: "35%"
                    fill: "url(#radial__005)"
                    filter: "url(#wald)"
                    ,
                circle
                    onClick: @changeMode
                    cx: "50%"
                    cy: "50%"
                    r: "26%"
                    fill: "url(#img_2)"
                    #filter: "url(#wald)"
                    ,


module.exports = -> ph_glyph_000