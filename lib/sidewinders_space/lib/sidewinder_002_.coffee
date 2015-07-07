# sidewinder_001_
#
{c, React, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject} = React.DOM
anchor_000 = require('./lib/anchor_000_.coffee')()

c 'foreign object is', foreignObject
sidewinder = rr


    __inverse__transform: (vec) ->
        math.multiply(math.inv(@props.transform_matrix), vec)
    __transform: (vec) ->
        math.multiply @props.transform_matrix, vec

    getInitialState: ->
        value: 'hello3'
        p0: [3, 70, 1]
        p1: [-30, -20, 1]
        p2: [30, -20, 1]
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
        vector_complex.reduce (acc, i) =>
            acc + " " + @single_vector_to_svg_friendly_string(i)
        , ""
    removeDragEvents: ->
        document.removeEventListener 'mousemove', @onMouseMove
        document.removeEventListener 'mouseup', @onMouseUp
    onMouseMove: (e) ->
        deltaX = (e.pageX) - (@state.originX)
        deltaY = (e.pageY) - (@state.originY)
        notionally = [e.pageX, e.pageY, 1]
        qubit = math.inv @props.transform_matrix
        mongo = math.multiply qubit, notionally
        @setState
            "#{@p}": mongo
    addDragEvents: (p_) ->
        @p = p_
        document.addEventListener 'mouseup', @onMouseUp
        document.addEventListener 'mousemove', @onMouseMove
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
                onClick: => if @props.from_hex is on then @props.set_content_vector(@props.section, @props.cell) else return null
                points: triangle.string


            M = @props.transform_matrix
            preArry = [@state.p0, @state.p1, @state.p2]
            for i in [1 .. 3]
                mango = math.multiply M, [[1,0,(30 * i)],[0,1,(-20 * i)],[0,0,1]]
                arry = for ii, idx in preArry
                    math.multiply mango, ii
                amp = @bunch_of_vectors_to_svg_friendly_string(arry)
                polygon
                    points: amp

            raa = triangle.arry
            x_comp = ((raa[0][0] + raa[1][0] + raa[2][0]) / 3) - 20
            y_comp = ((raa[0][1] + raa[1][1] + raa[2][1]) / 3) - 10
            foreignObject
                width: '100%'
                height: '100%'
                onClick: => if @props.from_hex is on then @props.set_content_vector(@props.section, @props.cell) else return null
                input
                    onChange: (e) => @setState
                        value: e.currentTarget.value
                    type: 'text'
                    value: @state.value
                    style:
                        color: 'white'
                        background: 'transparent'
                        border: 'none'
                        position: 'absolute'
                        top: y_comp
                        left: x_comp

            for i, idx in ['p0', 'p1', 'p2']
                nice_try = [
                    [.033, 0, @state[i][0]]
                    [0, .3, @state[i][1]]
                    [0, 0, 1]
                ]
                anchor_transform_matrix = math.multiply(@props.transform_matrix, nice_try)
                anchor_000
                    transform_matrix: anchor_transform_matrix
                    onMouseDown: @onMouseDown.bind(@, i)
                    onMouseUp: @onMouseUp.bind(@, i)









module.exports = -> sidewinder