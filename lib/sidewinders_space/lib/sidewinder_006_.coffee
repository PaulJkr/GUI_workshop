# sidewinder_003_
# : working to get the full pipeline running now for svg path elements,
# interfacing to the transform protocol

# todo:  establish shared initial alias for M and iM inverse of M

{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM
anchor_000 = require('./lib/anchor_000_.coffee')()

control_panel = rr

    render: ->
        svg
            width: '100%'
            height: '100%'
            circle
                cx: 20
                cy: 20
                r: 20

content = rr
    clicked: (e) ->
        @props.action?()
        @setState
            fill: 'lightgreen'
        setTimeout =>
            @setState
                fill: 'lightgrey'
        , 300

    getInitialState: ->
        fill: 'lightgrey'
        rx: 48
        ry: 60
        action_name: @props.action_name or 's'

    cirque: ->
        M = @props.transform_matrix
        cx : 0 + M[0][2]
        cy : 0 + M[1][2]
        r : 40 * M[0][0]

    textic: ->
        {rx, ry, action_name} = @state

        M = @props.transform_matrix

        origin = [0, 0, 1]
        transformed_origin = math.multiply M, origin
        scale = M[0][0]
        width = rx * M[0][0]
        height = ry * M[0][0]

        fontSize: (ry * .1) * scale
        x: transformed_origin[0] - ((action_name.length / 2) * scale * 3)
        y: transformed_origin[1]# + (height * .3 )
        width: width
        height: height
        onClick: @clicked


    elliptic: ->
        M = @props.transform_matrix
        {rx, ry} = @state

        cx: 0 + M[0][2]
        cy: 0 + M[1][2]
        rx: rx * M[0][0]
        ry: ry * M[0][0]
        #filter: 'url(#disabled)'
        fill: @state.fill
        onClick: @clicked


    render: ->

        M = @props.transform_matrix
        #cirque = @cirque()
        svg
            width: '100%'
            height: '100%'
            defs
                filter
                    id: 'disabled'
                    feGaussianBlur
                        in: "SourceAlpha"
                        result: "blurOut"
                        stdDeviation: "4"
                    feOffset
                        in: "blurOut"
                        result: "dropBlur"
                        dx: "5"
                        dy: "5"

            #circle cirque
            ellipse @elliptic()
            text @textic(), (@state.action_name or 'helo')






























sidewinder = rr
    render: ->
        props = assign {}, @props, ref: 'content'
        if @props.from_root is on
            props = assign props, action_name: 'pale'
        svg
            width: '100%'
            height: '100%'
            content props
            if @props.from_root is on
                control_panel()


module.exports = -> sidewinder