{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, text, ellipse} = React.DOM



text_input_001 = rr

# i need to redesign state. on paper.  # TODO :: REFACTOR THIS opening gambit.

# perf addon & change data structures
# immutables should componentUpdate

    rad_to_deg: (rad) ->
        57.2957795 * rad

    random_luminal: ->

    random_saturation: ->

    random_hue: ->
        pi = Math.PI
        @rad_to_deg(Math.random() * 2 * pi)

    # listen_for_keys: ->
    #     c "@state.focused", @state.focused
    #     if @state.focused
    #         document.addEventListener "keydown", ->
    #             c "have a keydown event"
    #     else
    #         document.removeEventListener "keydown", null

    func_001: (e) ->
        c "have a keydown event #{Math.random()}"
        c e.key
        if e.key isnt "Backspace"
            @setState
                message: @state.message + e.key
        else
            @setState
                message: @state.message.slice(0, -1)

    handle_click: (e) ->
        if not(@state.focused)
            React.findDOMNode(@refs.input_0099).focus()
        else
            React.findDOMNode(@refs.input_0099).blur()
        @setState
            focused: not @state.focused

    # componentDidMount: ->
    #     window.addEventListener "resize", =>
    #         c "resizing"
    #         c @forceUpdate(@)

    componentDidMount: ->
        imp = React.findDOMNode(@)
        rect = imp.getBoundingClientRect()
        @setState
            font_size: rect.height / 20

    getInitialState: ->
        message: 'the initial message'
        focused: off
        position:
            x: "50%"
            y: "50%"
            r: "35%"
        grad:
            stop_0: "hsl(#{@random_hue()},90%,80%)"
            stop_1: "hsl(#{@random_hue()},90%,80%)"

    handleChange: (e) ->
        c 'e', e
        @setState
            message: e.currentTarget.value

    render: ->
        div
            style:
                position: 'absolute'
                width: '100%'
                height: '100%'
            ,
            input
                maxLength: 20
                onChange: @handleChange
                ref: 'input_0099'
                style:
                    background: 'transparent'
                    #visibility: 'hidden'
                    border: 'none'
                    outline: 'none'
                    opacity: 0
            input
                value: @state.message
                maxLength: 20
                onChange: @handleChange
                ref: 'input_0099'
                style:
                    fontSize: 23
                    position: 'absolute'
                    top: "50%"
                    left: "50%"
                    background: 'transparent'
                    #visibility: 'hidden'
                    border: 'none'
                    outline: 'none'
                    opacity: 1
            svg
                width: '100%'
                height: '100%'
                ,
                defs
                    radialGradient
                        id: 'radial__005'
                        ,
                        stop
                            offset: "10%"
                            stopColor: @state.grad.stop_0
                        stop
                            offset: "83%"
                            stopColor: @state.grad.stop_1


                # circle
                #     onClick: @handle_click
                #     cx: @state.position.x
                #     cy: @state.position.y
                #     r: @state.position.r
                #     fill: 'url(#radial__005)'
                ellipse
                    onClick: @handle_click
                    cx: @state.position.x
                    cy: @state.position.y
                    rx: @state.position.r
                    ry: "28%"
                    fill: 'url(#radial__005)'
                    ,
                text
                    onClick: @handle_click
                    x: "30%"
                    y: "50%"

                    fontSize: @state.font_size
                    ,
                    @state.message
                text
                    onClick: @handle_click
                    x: "30%"
                    y: "70%"

                    fontSize: @state.font_size
                    ,
                    @state.message


                circle
                    cx: "8%"
                    cy: "80%"
                    r: "4%"
                    fill: if @state.focused then 'red' else 'black'
                    ,
                # text
                #     x: "45%"
                #     y: "45%"
                #     ,
                #     @state.message



module.exports = -> text_input_001