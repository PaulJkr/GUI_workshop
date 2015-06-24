
{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

require_dyn = require.context('./lib', true, /.coffee$/)

basket = for i in require_dyn.keys()
    require_dyn(i)()()

basket_2 = require_dyn.keys().reduce (acc, i) ->
    acc[i] = require_dyn(i)()
    acc
, {}

c 'basket_2', basket_2

# c 'image', image
# c 'feOffset', feOffset
# c 'polygon', polygon, Object.keys(polygon)
# c 'feBlend', feBlend
# c 'filter', filter, Object.keys(filter)
# c 'image', Object.keys(image)
# c 'radialGradient', radialGradient

arrows = rr

    # change_gig: ->
    #     c 'change_gig'
    #     c arguments[0], arguments[1], arguments[2]
    #     ciph = arguments[0]


    position_calculate: (i, j) ->
        grid_width = Math.floor @state.iW / @state.grid_cell_size.x
        grid_height = Math.floor @state.iH / @state.grid_cell_size.y

        top: (@state.grid_cell_size.y ) * j
        left: (@state.grid_cell_size.x ) * i

    componentDidMount: ->
        window.addEventListener 'resize', (e) =>
            @setState
                iW: window.innerWidth - @state.padding
                iH: window.innerHeight - @state.padding
                

    getInitialState: ->
        grid_cell_size_x = 200
        grid_cell_size_y = 200
        padding = 10
        padding: padding
        iW: window.innerWidth - (2 * padding)
        iH: window.innerHeight - (2 * padding)
        grid_cell_size: {x: grid_cell_size_x, y: grid_cell_size_y}
        __00:
            x: 30
            y: 30
            r: 20

    handle_click_0: (e) ->
        @setState
            __00:
                x: 36
                y: 36
                r: 40
        setTimeout =>
            @setState
                __00:
                    x: 30
                    y: 30
                    r: 20
        , 1000

    render: ->
        keys__ = Object.keys basket_2
        c 'keys__', keys__
        grid_width = Math.floor @state.iW / @state.grid_cell_size.x
        grid_height = Math.floor @state.iH / @state.grid_cell_size.y

        remainder_H = (@state.iH / @state.grid_cell_size.y) - grid_height
        remainder_W = (@state.iW / @state.grid_cell_size.x) - grid_width

        div
            style:
                position: 'absolute'
                width: @state.iW - (@state.padding / 2)
                height: @state.iH - (@state.padding / 2)
                top: @state.padding
                left: @state.padding
                #border: '2px solid grey'
                #borderRadius: 7

            ,
            div
                style:
                    position: 'absolute'
                    width: '100%'
                    height: '100%'
                    top: (remainder_H / 2) * @state.grid_cell_size.y
                    left: (remainder_W / 2) * @state.grid_cell_size.x
                    right: (remainder_W / 2) * @state.grid_cell_size.x
                    bottom: (remainder_H / 2) * @state.grid_cell_size.y
                ,
                for j in [0 .. (grid_height - 1)]
                    for i in [0 .. (grid_width - 1)]
                        cursor = keys__.pop()
                        elk = basket_2[cursor]
                        div
                            style:
                                position: 'absolute'
                                width: @state.grid_cell_size.x
                                height: @state.grid_cell_size.y
                                top: @position_calculate(i, j).top
                                left: @position_calculate(i, j).left
                                border: '1px solid black'
                            ,

                            #basket.pop()
                            if typeof elk is 'function'
                                elk
                                    section: @props.section
                                    cursor: cursor
                                    change_gig: @props.change_gig
                                    focus_cell_selection: @props.focus_cell_selection

                            


module.exports = -> arrows