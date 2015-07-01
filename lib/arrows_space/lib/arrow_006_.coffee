
{c, React, rr, shortid, assign, update, __react__root__} = require('../../__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, text} = React.DOM

arrow = rr

    componentWillUnmount: ->
        c @interval_000
        clearInterval @interval_000

    getInitialState: ->
        arrow_stroke: 'red'
        fill_stroke: 'blue'
        rotate: 0

    shuffle_stroke: ->
        start = new Date().getTime()
        @interval_000 = setInterval =>
            now = new Date().getTime()
            scaling_factor = .10
            delta = start - now
            delta *= scaling_factor
            @setState
                arrow_stroke: "hsl(#{(delta + 90) % 360}, 99%, 77%)"
                fill: "hsl(#{(delta + 210) % 360}, 99%, 77%)"
                rotate: (delta + 120) % 360
        , 1

    componentDidMount: ->
        rect = React.findDOMNode(@).getBoundingClientRect()
        @setState
            rect_width: rect.width
            rect_height: rect.height
        @shuffle_stroke()
        window.addEventListener 'resize', (e) =>

            if @isMounted()
                rect = React.findDOMNode(@).getBoundingClientRect()
                @setState
                    rect_width: rect.width
                    rect_height: rect.height
                    # # iW: @props.innerWidth
                    # # iH: @props.innerHeight
                    # iW: window.innerWidth - @state.padding
                    # iH: window.innerHeight - @state.padding

    render: ->
        #c '@props in arrow_006', @props
        if @state?.rect_width?
            svg
                width: '100%'
                height: '100%'
                onMouseOver: => @setState({info: on})
                onMouseLeave: => @setState({info: off})
                onClick: => @props.focus_cell_selection(@props.section, @props.cursor)
                ,
                g
                    #translate(#{rect.width / 3})
                    transform: "rotate(#{@state.rotate}, #{rect.width * .5}, #{rect.height * .5})"
                    ,
                    circle
                        cx: '30%'
                        cy: '20%'
                        r: '10%'
                        fill: @state.arrow_stroke
                        stroke: @state.fill
                    circle
                        cx: '24%'
                        cy: '30%'
                        r: '18%'
                        opacity: 0.5
                        fill: @state.fill
                    path
                        stroke: @state.arrow_stroke
                        fill: @state.fill
                        strokeWidth: 1
                        d: "M #{rect.width * .5} #{rect.height * .45} L #{rect.width * .85} #{rect.height * .5} L #{rect.width * .5} #{rect.height * .55} Z"
                    circle
                        cx: '50%'
                        cy: '50%'
                        r: '10%'
                        fill: @state.arrow_stroke
                        opacity: 0.7
                if @state.info is on
                    g
                        opacity: 0.5
                        fill: 'green'
                        ,
                        text
                            x: "20%"
                            y: "15%"
                            stroke: 'black'

                            onClick: => @props.focus_cell_selection(@props.section, @props.cursor)
                            style:
                                cursor: 'pointer'
                            ,
                            @props.cursor
        else
            svg
                width: '100%'
                height: '100%'


module.exports = -> arrow