# sidewinder_003_
# : working to get the full pipeline running now for svg path elements,
# interfacing to the transform protocol

# todo:  establish shared initial alias for M and iM inverse of M

{c, React, Imm, rr, shortid, keys, assign, update, __react__root__, math} = require('../../__boiler__plate__.coffee')()
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM
anchor_000 = require('./lib/anchor_000_.coffee')()

control_panel = rr

    componentDidMount: ->

    button_000: ->
        [
            [.18, 0, 120]
            [0,.18, 50]
            [0, 0, 1]
        ]
    button_001: ->
        [
            [.16, 0, 120]
            [0,.16, -50]
            [0, 0, 1]
        ]

    render: ->
        svg
            width: '100%'
            height: '100%'
            # content
            #     action_name: 'king'
            #     transform_matrix: math.multiply @props.transform_matrix, @button_000()
            # content
            #     action_name: 'the'
            #     transform_matrix: math.multiply @props.transform_matrix, @button_001()



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
        c 'rx', rx
        M = @props.transform_matrix

        origin = [0, 0, 1]
        transformed_origin = math.multiply M, origin
        scale = M[0][0]
        width = rx * M[0][0]
        height = ry * M[0][0]
        fontSize: (ry * .5) * scale
        x: transformed_origin[0] - (rx * .5 * scale)
        y: transformed_origin[1] + (ry * .13 * scale)
        width: width
        height: height
        filter: 'url(#disabled)'
        onClick: @clicked


    elliptic: ->
        M = @props.transform_matrix
        {rx, ry} = @state

        cx: 0 + M[0][2]
        cy: 0 + M[1][2]
        rx: rx * M[0][0]
        ry: ry * M[0][0]
        filter: 'url(#disabled)'
        fill: @state.fill
        onClick: @clicked


    # we need to do path command interfaces
    # we need interfaces --complexes of controls and instrumentation
    # for commands:
    # M, m
    # L
    # H, h
    # V, v
    # Z (?)
    # C, c
    # S, s
    # Q, q
    # T, t
    # A, a

    # the controls can be described in functions on the object
    # before they are inserted into the render function. also more we do this
    # more should be able to reuse code.

    standard_number_input: ->
        # these are the attributes to put to the stardard number input
        # perform calculations here
        #returning object:
        type: 'number'
        value: 'helo' #@props.state[j] or something
        style:
            fontSize: 4 # scale by some variable by transform_matrix
            background: 'transparent'
            border: 'none'
        onChange: (e) =>
            c 'changed'
            #@props.changeVal(j, e.currentTarget.value)

    M_command: -> # not to be confused with M the transform_matrix
        # needs two number input boxes for the vector coordinates
        # needs a button to delete the command
        # we might want to shift order around, but that's for later
        # actually this should be a component because it can be decomposed ?
        # the number input boxes will be reused
        # for now though just here


    # one good question is whether or not the on-screen draggable anchors
    # associated with command parameters --like (x,y) vector of a M command
    # should be implemented within or as a descendant of the command control
    # or whether it should be utterly independent of that line.  probbably the 
    # former.

    # reminder: within the ideal coordinate system one can measure the 
    # dimensions of the object exactly, so it should be a deterministic thing
    # to , within another context , know exactly the transform matrix needed to
    # place the component within a particular space size in that other context.


    render: ->
        # this is now just to be an M command. we'll do other components for 
        # all the others, and in the end wonder how to do the optimisaition
        # provided by inheritance, or not.  this file ultimately just for the
        # comments.
        M = @props.transform_matrix
        Sc_x = M[0][0]
        Sc_y = - M[1][1]
        c "Sc_x, Sc_y", Sc_x, Sc_y

        # actually the fOs are one each to an input, and should be just placed
        # over custom svg graphics, with the fO inputs' stuff all invisible 
        # except the text.  
        # could make one of these objects per input instead of per fO
        # so they share sort of, will see
        fO_0 = ->
            locus = [-40, 0, 1]
            span = [60, 20, 1] # [width, height] in our ideal coordinate system
            M_l = math.multiply M, locus
            Sc_span = [span[0] * Sc_x, span[1] * Sc_y]
            #---------------------
            M_l : M_l
            Sc_span : Sc_span
            fontSize: Sc_span[1] * .5
            # we might not actually have to return all of that. it's just the 
            # transformed coordinates that the render needs.

        fO_1 = ->
            locus = [0, 0, 1]
            span = [60, 20, 1] # [width, height] in our ideal coordinate system
            M_l = math.multiply M, locus
            Sc_span = [span[0] * Sc_x, span[1] * Sc_y]
            #---------------------
            M_l : M_l
            Sc_span : Sc_span
            fontSize: Sc_span[1] * .5





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
            fO_0 = fO_0()
            fO_1 = fO_1()

            foreignObject
                x: fO_0.M_l[0]
                y: fO_0.M_l[1]
                width: fO_0.Sc_span[0]
                height: fO_0.Sc_span[1]
                input
                    #type: 'number'
                    value: 'helo'
                    style:
                        background: 'transparent'
                        border: 'none'
                        fontSize: fO_0.fontSize
            rect
                x: fO_0.M_l[0]
                y: fO_0.M_l[1]
                width: fO_0.Sc_span[0] * .5
                height: fO_0.Sc_span[1]
                fillOpacity: 0
                stroke: 'red'
            foreignObject
                x: fO_1.M_l[0]
                y: fO_1.M_l[1]
                width: fO_1.Sc_span[0]
                height: fO_1.Sc_span[1]
                input
                    #type: 'number'
                    value: 42
                    style:
                        background: 'transparent'
                        border: 'none'
                        fontSize: fO_1.fontSize
            rect
                x: fO_1.M_l[0] - (fO_1.Sc_span[0] * .1)
                y: fO_1.M_l[1] - (fO_1.Sc_span[1] * .3)
                width: fO_1.Sc_span[0] * .5
                height: fO_1.Sc_span[1]
                fillOpacity: 0
                stroke: 'blue'
















            #circle cirque
            # ellipse @elliptic()
            # text @textic(), (@state.action_name or 'helo')















            if @props.from_root is on
                control_panel
                    transform_matrix: @props.transform_matrix


sidewinder = rr

    componentWillMount: ->
        map1 = Imm.Map
            a: 1
            b: 2
            c: 3
        c 'map1', map1
        x = 'a'
        c 'get', map1.get(x)

    render: ->
        content_props = assign {}, @props, {ref: "content"}
        if @props.from_root is on
            content_props = assign content_props, action_name: 'pale'
        svg
            width: '100%'
            height: '100%'
            content content_props
            # if @props.from_root is on
            #     control_panel
            #         transform_matrix: @props.transform_matrix
            # i want them to have sibling relationship instead of 
            # inheritance ; horizontal composition.
            # but will need to implement flux or something similar
            # dispatch pattern ; the refs thing is for mildly exotic 
            # edge cases , not a general-purpose communications system
            # for horizontal composition usage contexts
            # for the moment just going to make control panel 
            # conditionally (if from_root is on) a child of content, 
            # and pass props,  ... this may be better in the end 
            # for this particular case anyway.



module.exports = -> sidewinder