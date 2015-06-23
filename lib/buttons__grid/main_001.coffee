
{c, React, rr, shortid, assign, update, __react__root__} = require('../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient} = React.DOM

requireTest = require.context('./', true, /.coffee$/)

basket_2 = for i in requireTest.keys()
    if (i isnt "./main_001.coffee") and (i isnt "./main.coffee")
        requireTest(i)()()

# c 'image', image
# c 'feOffset', feOffset
# c 'polygon', polygon, Object.keys(polygon)
# c 'feBlend', feBlend
# c 'filter', filter, Object.keys(filter)
# c 'image', Object.keys(image)
# c 'radialGradient', radialGradient

buttons__grid = rr

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
        grid_cell_size_x = 160
        grid_cell_size_y = 160
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
        c 'button_5'
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
                        div
                            style:
                                position: 'absolute'
                                width: @state.grid_cell_size.x
                                height: @state.grid_cell_size.y
                                top: @position_calculate(i, j).top
                                left: @position_calculate(i, j).left
                                border: '1px solid black'
                            ,
                            basket_2.pop()
                            #button_005()
                            # if (j is 0) and (i is 0)
                            #     button_004()
                            # if (j is 0) and (i is 1)
                            #     button_002()
                            # if (j is 0) and (i is 2)
                            #     button_003()
                            # if (j is 0) and (i is 3)
                            #     button_005()
                            # if (j is 1) and (i is 0)
                            #     text_input_001()
                            # if (j is 1) and (i is 1)
                            #     ph_glyph_000()

module.exports = -> buttons__grid