

document.getElementsByTagName('body')[0].style.overflow = 'hidden'
document.getElementById('__react__root__').style.overflow = 'hidden'

require('./__monkey_patch_succeeds__.coffee') # doesn't work, keeping it to try again in new way
#require('./lib/main.styl') # nothing in it

{c, React, rr, shortid, assign, update, __react__root__} = require('./lib/__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM

{ section_views, components_baskets_indexed_by_section } = require('./__payload__outlay__.coffee')()


test = rr
    render: ->
        div null, 'heading'


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

    componentDidMount: ->
        window.addEventListener "resize", =>
            @forceUpdate()

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

    set_content_vector: (section, cell) ->
        c "setting with", section, cell
        payload_000 =
            section: section
            cell: cell
        payload_000s= JSON.stringify(payload_000)
        localStorage.setItem 'gui_workshop_nav_state',
            payload_000s
        c "verify with:"
        c JSON.parse payload_000s

        @setState
            section: section
            cell: cell
            content: @calc_content

    getInitialState: ->
        # section= 'arrows'
        # #cell= './arrow_004_.coffee'
        # cell= 'section_root'
        # initial=
        #      content: @calc_content.bind section, cell
        #      section: section
        #      cell: cell


        # payload_001 =
        #     section: 'arrows'
        #     cell: 'section_root'
        # payload_001s = JSON.stringify payload_001
        # localStorage.setItem 'gui_workshop_nav_state', payload_001s


        imp = localStorage.getItem 'gui_workshop_nav_state'
        if imp?

            imp2 = JSON.parse imp
            c 'imp2', imp2
            initial2 =
                content: @calc_content.bind imp2.section, imp2.cell
                section: imp2.section
                cell: imp2.cell
            return initial2

        # imp = localStorage.getItem 'gui_workshop_nav_state'
        # if imp?
        #     c 'imp', JSON.parse(imp)

        section = 'arrows'
        cell = 'section_root'
        initial =
            content: @calc_content.bind section, cell
            section: section
            cell: cell

    render: ->
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
                set_content_vector: @set_content_vector
                focus_cell_selection: @set_content_vector #deprecate
                section: @state.section
                cell: @state.cell
                cursor: @state.cell #todo collapse redundancy
            div
                style:
                    position: 'fixed'
                    height: '20%'
                    width: '10%'
                    top: 0
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
                        top: '50%'
                        left: '10%'
                    ,
                    if @state.cell isnt 'section_root'
                        @state.cell



React.render main(), __react__root__
