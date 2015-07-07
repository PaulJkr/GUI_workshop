

document.getElementsByTagName('body')[0].style.overflow = 'hidden'
document.getElementById('__react__root__').style.overflow = 'hidden'

require('./__monkey_patch_succeeds__.coffee') # doesn't work, keeping it to try again in new way
#require('./lib/main.styl') # nothing in it

{c, React, rr, shortid, assign, update, __react__root__} = require('./lib/__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM

{ section_views, components_baskets_indexed_by_section } = require('./__payload__outlay__.coffee')()

adhoc_section_link = rr
    render: ->
        div
            style:
                position: 'absolute'
                top: @props.top
                left: '10%'
                cursor: 'pointer'
                color: @props.color
            onClick: (e) => @props.vector_set(@props.name, 'section_root')
            ,
            @props.name

main = rr
    componentWillUnmount: ->
        window.onresize = null
    set_boundingRect: ->
        @forceUpdate() #without the forceUpdate call
        # getBoundingClientRect returns old value, which causes
        #total error on doubleclick title bar resizes.
        bounding_rect = React.findDOMNode(@).getBoundingClientRect()
        @setState
            view_width: bounding_rect.width
            view_height: bounding_rect.height
            x: bounding_rect.width / 2 # transform coordinate system
            y: bounding_rect.height / 2 # translation of coordinate
    debounce: (func, wait, immediate) ->
        timeout = 'scoped here'
        ->
            context = @
            args = arguments
            later = ->
                timeout = null
                if not(immediate) then func.apply(context, args)
            callNow = immediate and not(timeout)
            clearTimeout(timeout)
            timeout = setTimeout(later, wait)
            if callNow then func.apply(context, args)
    debounced_set_boundingRect: -> @debounce(@set_boundingRect, 100)()
    componentDidMount: ->
        @set_boundingRect()
        window.onresize = @debounced_set_boundingRect
    remove_screenHint: ->
        @setState
            screenHint: -> #nothing not null
    changeContent: ->
        @setState
            content: arguments[0]
    calc_content: (section, cell) ->
        if @state.cell is 'section_root'
            section_views[@state.section]
        else
            components_baskets_indexed_by_section[@state.section][@state.cell]
    set_content_vector: (section, cell, scale_dimension) ->
        c "section, cell", section, cell
        payload_000 =
            section: section
            cell: cell
            scale_dimension: scale_dimension
        payload_000s= JSON.stringify(payload_000)
        localStorage.setItem 'gui_workshop_nav_state',
            payload_000s
        @setState
            scale_dimension: scale_dimension or 80 #todo unhardcode this
            section: section
            cell: cell
            content: @calc_content
    calc_smallest_dim: ->
        if @state.view_width > @state.view_height
            return @state.view_height
        else
            return @state.view_width
    getInitialState: ->


        # payload_001 =
        #     section: 'sidewinders'
        #     cell: './sidewinder_002_.coffee'
        # payload_001s = JSON.stringify payload_001
        # localStorage.setItem 'gui_workshop_nav_state', payload_001s


        imp = localStorage.getItem 'gui_workshop_nav_state'
        if imp?
            imp2 = JSON.parse imp
            initial2 =
                content: @calc_content.bind imp2.section, imp2.cell
                section: imp2.section
                cell: imp2.cell
                scale_dimension: imp2.scale_dimension or 80
            return initial2
        section = 'arrows'
        cell = 'section_root'
        initial =
            content: @calc_content.bind section, cell
            section: section
            cell: cell
            scale_dimension: 80 # todo unhardcode this
    render: ->
        if not @state.view_width
            div
                style:
                    position: 'absolute'
                    width: window.innerWidth
                    height: window.innerHeight
                    left: 0
                    right: 0
                    top: 0
                    bottom: 0
                ,
        else
            smaller = if @state.view_width < @state.view_height then @state.view_width else @state.view_height
            z = smaller / 200
            div
                style:
                    position: 'absolute'
                    width: window.innerWidth
                    height: window.innerHeight
                    left: 0
                    right: 0
                    top: 0
                    bottom: 0
                ,
                @state.content?()
                    transform_matrix: [[z, 0, (@state.view_width / 2)],[0, -z, (@state.view_height / 2)],[0, 0, 1]]
                    from_root: on
                    set_content_vector: @set_content_vector
                    focus_cell_selection: @set_content_vector #deprecate
                    section: @state.section
                    cell: @state.cell
                    cursor: @state.cell #todo collapse redundancy
                    scalar_000: @calc_smallest_dim() / @state.scale_dimension or 80
                    view_width: @state.view_width
                    view_height: @state.view_height
                    x: @state.x # transform coordinate system
                    y: @state.y # translation of coordinate
                div
                    style:
                        position: 'fixed'
                        height: '40%'
                        width: '10%'
                        top: "30%"
                        left: 0
                    ,
                    div
                        style:
                            position: 'absolute'
                            width: '100%'
                            height: '100%'
                            background: 'grey'
                            opacity: 0.7
                        ,
                    for key, idx in Object.keys(section_views)
                        adhoc_section_link
                            vector_set: @set_content_vector
                            name: key
                            top: "#{(idx * 20) + 10}%"
                            color: if key is @state.section then 'orange' else 'green'
                    div
                        style:
                            position: 'absolute'
                            top: '70%'
                            left: '10%'
                        ,
                        if @state.cell isnt 'section_root'
                            @state.cell

React.render main(), __react__root__