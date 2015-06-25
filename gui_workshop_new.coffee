

document.getElementsByTagName('body')[0].style.overflow = 'hidden'
document.getElementById('__react__root__').style.overflow = 'hidden'

require('./__monkey_patch_failure__.coffee') # doesn't work, keeping it to try again in new way
#require('./lib/main.styl') # nothing in it

{c, React, rr, shortid, assign, update, __react__root__} = require('./lib/__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM

{ charta, require_arrows, arrows, arrows_basket, sections_basket } = require('./__payload__outlay__.coffee')()


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
            charta[@state.section]
        else
            sections_basket[@state.section][@state.cell]

    set_content_vector: (section, cell) ->
        payload_000=
            section: section
            cell: cell
        payload_000s= JSON.stringify(payload_000)
        localStorage.setItem 'gui_workshop_nav_state',
            payload_000s
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
            initial2 =
                content: @calc_content.bind imp2.section, imp2.cell
                section: imp2.section
                cell: imp2.cell
            return initial2
        return initial

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
            if @state.content?
                @state.content()
                    #focus_cell_selection: @focus_cell_selection
                    focus_cell_selection: @set_content_vector
                    section: @state.section
                    cell: @state.cell
            div
                style:
                    position: 'fixed'
                    height: '10%'
                    width: '6%'
                    top: 0
                    left: 0
                ,
                div
                    style:
                        position: 'absolute'
                        width: '100%'
                        height: '100%'
                        background: 'grey'
                        opacity: 0.8
                    ,
                div
                    style:
                        position: 'absolute'
                        top: '10%'
                        left: '10%'
                        cursor: 'pointer'
                    onClick: (e) => @set_content_vector(@state.section, 'section_root')
                    ,
                    @state.section
                div
                    style:
                        position: 'absolute'
                        top: '50%'
                        left: '10%'
                    ,
                    if @state.cell isnt 'section_root'
                        @state.cell



React.render main(), __react__root__
