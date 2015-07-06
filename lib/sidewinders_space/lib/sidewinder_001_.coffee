{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

anchor_000 = require('./lib/anchor_000_.coffee')()

sidewinder = rr

    getInitialState: ->
        p0: [0, 70, 1]
        p1: [-30, -80, 1]
        p2: [30, -80, 1]

    cirque: ->
        transform_matrix = @props.transform_matrix
        vec_000 = [0, 0, 1]
        vec_001 = math.multiply(transform_matrix, vec_000)
        r = transform_matrix[0][0] * 50
        cx: vec_001[0]
        cy: vec_001[1]
        r: r

    triangle: ->
        M = @props.transform_matrix
        preArry = [@state.p0, @state.p1, @state.p2]
        arry = for i, idx in preArry
            math.multiply M, i
        amp = @bunch_of_vectors_to_svg_friendly_string(arry)
        return string: amp, arry: arry

    single_vector_to_svg_friendly_string: (vec_2) ->
        "#{vec_2[0]},#{vec_2[1]}"

    bunch_of_vectors_to_svg_friendly_string: (vector_complex) ->
        strang = vector_complex.reduce (acc, i) =>
            acc + " " + @single_vector_to_svg_friendly_string(i)
        , ""
        return strang

    # removeDragEvents: ->
    #     document.removeEventListener 'mousemove', @onMouseMove_p0
    #     document.removeEventListener 'mousemove', @onMouseMove_p1
    #     document.removeEventListener 'mousemove', @onMouseMove_p2
    #     document.removeEventListener 'mouseup', @onMouseUp
    onMouseMove: (p_, e) ->
        c 'p_', p_
        deltaX = (e.pageX) - (@state.originX)
        deltaY = (e.pageY) - (@state.originY)
        @setState
            "#{p_}": [e.pageX, e.pageY]
    addDragEvents: (p_) ->

        document.addEventListener 'mouseup', @onMouseUp
        document.addEventListener 'mousemove', @onMouseMove.bind(p_)

    onMouseUp: ->
        @removeDragEvents()
    onMouseDown: (p_, e) ->
        e.preventDefault()
        e.stopPropagation()

        @addDragEvents(p_)
        pageOffset = e.currentTarget.getBoundingClientRect()
        @setState
            originX: e.pageX
            originY: e.pageY
            elementX: pageOffset.left
            elementY: pageOffset.top

    render: ->
        triangle = @triangle()
        svg
            width: '100%'
            height: '100%'
            polygon
                onClick: => @props.set_content_vector(@props.section, @props.cell)
                points: triangle.string
            # for i, idx in [@state.p0, @state.p1, @state.p2]
            for i, idx in ['p0', 'p1', 'p2']
                nice_try = [
                    [.068, 0, @state[i][0]]
                    [0, .3, @state[i][1]]
                    [0, 0, 1]
                ]
                anchor_transform_matrix = math.multiply(@props.transform_matrix, nice_try)
                anchor_000
                    transform_matrix: anchor_transform_matrix
                    onMouseDown: @onMouseDown.bind(@, i)






module.exports = -> sidewinder