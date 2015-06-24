

document.getElementsByTagName('body')[0].style.overflow = 'hidden'
document.getElementById('__react__root__').style.overflow = 'hidden'

require('./__monkey_patch_failure__.coffee') # doesn't work, keeping it to try again in new way
#require('./lib/main.styl') # nothing in it

{c, React, rr, shortid, assign, update, __react__root__} = require('./lib/__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM

{ charta, require_arrows, arrows, arrows_basket, sections_basket } = require('./__payload__outlay__.coffee')()


main = rr

    focus_cell_selection: (section, cell) ->
        # section could be 'arrows'
        # cell could be './arrow_001_.coffee'

        # we should get this from state here at root
        # in order to avoid propagating redundant information
        # so, when initial state is set, 
        # content could be a computed value of 
        # some vector like (section, cell)
        # but for now avoid nesting it.  
        # before we hook it up we can and should
        # wire up the second nav system, which will 
        # implement the same protocol
        c 'section', section, 'cell,', cell

        @setState
            content: -> sections_basket[section][cell]
            section: section
            cell: cell

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
            c 'got root'
            charta[@state.section]
        else
            sections_basket[@state.section][@state.cell]

        #arrows_basket[Object.keys(arrows_basket)[3]]

    set_content_vector: (section, cell) ->
        c 'cell', cell
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
        section= 'arrows'
        #cell= './arrow_004_.coffee'
        cell= 'section_root'

        initial=
             content: @calc_content.bind section, cell
             section: section
             cell: cell

        payload_001 =
            section: 'arrows'
            cell: 'section_root'
        payload_001s = JSON.stringify payload_001
        localStorage.setItem 'gui_workshop_nav_state', payload_001s

        # imp = localStorage.getItem 'gui_workshop_nav_state'
        # if imp?
        #     c 'have imp'
        #     imp2 = JSON.parse imp
        #     c imp2
        #     initial2 =
        #         content: @calc_content.bind imp2.section, imp2.cell
        #         section: imp2.section
        #         cell: imp2.cell
        #     return initial2




        # if Math.random() < .5
        #     payload_000=
        #         section: 'arrows'
        #         cell: 'section_root'
        #     payload_000s= JSON.stringify(payload_000)
        #     localStorage.setItem 'gui_workshop_nav_state',
        #         payload_000s
        # else
        #     c 'tSTNHEUistn'
        #     localStorage.removeItem 'gui_workshop_nav_state'


        # imp = localStorage.getItem('gui_workshop_nav_state')
        # # amp0= JSON.parse(localStorage.getItem('gui_workshop_nav_state'))
        # if imp isnt null
        #     imp2 = JSON.parse imp
        #     imp3=
        #         content: @calc_content.bind imp2.section, imp2.cell
        #         section: imp2.section
        #         cell: imp2.cell
            #initial = imp3
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
                    height: '5%'
                    width: '5%'
                    background: 'lightblue'
                    top: 0
                    left: 0
                ,
                div null, @state.section
                div null, @state.cell



React.render main(), __react__root__
