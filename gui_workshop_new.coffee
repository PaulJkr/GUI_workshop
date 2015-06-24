#----------------------------------------------
# monkey patch from
# https://gist.github.com/akre54/80eaa63762ea499029f0
#--------...... didn't work maybe another 
# doesn't work maybe some env change needed -- it's a different 
# developmental context it's used in.

ReactDOM = require 'react/build/modules/ReactDOM'
ReactElement = require 'react/build/modules/ReactElement'
ReactElementValidator = require 'react/build/modules/ReactElementValidator'
SVGDOMPropertyConfig = require 'react/build/modules/SVGDOMPropertyConfig'
DOMProperty = require 'react/build/modules/DOMProperty'
MUST_USE_ATTRIBUTE = DOMProperty.injection.MUST_USE_ATTRIBUTE


# createFactory = if __DEV__?
#     ReactElementValidator.createFactory
#   else
#     ReactElement.createFactory

createFactory = ReactElementValidator.createFactory

SVGDOMPropertyConfig.Properties.mask = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.filter = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.stdDeviation = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.result = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.mode = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.in = MUST_USE_ATTRIBUTE
    
ReactDOM.filter = createFactory 'filter'
ReactDOM.feGaussianBlur = createFactory 'feGaussianBlur'
ReactDOM.feBlend = createFactory 'feBlend'
ReactDOM.feOffset = createFactory 'feOffset'
ReactDOM.feMerge = createFactory 'feMerge'
ReactDOM.feMergeNode = createFactory 'feMergeNode'


require('./lib/main.styl')

{c, React, rr, shortid, assign, update, __react__root__} = require('./lib/__boiler__plate__.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM

document.getElementsByTagName('body')[0].style.overflow = 'hidden'
document.getElementById('__react__root__').style.overflow = 'hidden'

sidebar = require('./lib/nav_sidebar/sidebar_0_.coffee')()
room_2 = require('./lib/room_2/main.coffee')()
rule_30_0 = require('./lib/room_3/room_3_main_2_.coffee')()
room_3_0 = require('./lib/room_3/room_3_main_0_.coffee')()
room_3_1 = require('./lib/room_3/room_3_main_1_.coffee')()
room_3_3 = require('./lib/room_3/room_3_main_3_.coffee')()
screenHint = require('./lib/screen_hint_.coffee')()


buttons__grid = require('./lib/buttons__grid/main.coffee')()
buttons__grid_001 = require('./lib/buttons__grid/main_001.coffee')()
button_005 = require('./lib/buttons__grid/button_005_.coffee')()
text_input_001 = require('./lib/buttons__grid/text_input_001_.coffee')()
text_input_002 = require('./lib/buttons__grid/text_input_002_.coffee')()
ph_glyph_000 = require('./lib/buttons__grid/photo_derived_glyph_000_.coffee')()
ph_glyph_001 = require('./lib/buttons__grid/photo_derived_glyph_001_.coffee')()

#---------------------new paradigm-------------------------------------------
# -------------------------------  now can require once the main section file
# --------and then require the entire collection of units at a go
# ---------and should be able to focus gui on any one of those celled units
# as per the 'change_gig' function pattern below.
arrows = require('./lib/arrows_grid/main_000_.coffee')()
require_arrows = require.context('./lib/arrows_grid/lib', true, /.coffee$/)
arrows_basket = require_arrows.keys().reduce (acc, i) ->
    acc[i] = require_arrows(i)()
    acc
, {name: 'arrows'}
#---------------------------------------------------------
sections_basket = {}
sections_basket['arrows'] = arrows_basket






main = rr
    # so rename this and change the process, can stardardise it to organise by library section.
    # this section is arrows, but will have other catalogs..

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
            section: sections_basket[section].name

    # change_gig: (a) -> #deprecate to delete
    #     @setState
    #         content: -> arrows_basket[a]

    componentDidMount: ->
        window.addEventListener "resize", =>
            @forceUpdate()

    remove_screenHint: ->
        @setState
            screenHint: -> #nothing not null

    changeContent: ->
        @setState
            content: arguments[0]

    getInitialState: ->
        #ncontent: -> buttons__grid()
        #content: -> buttons__grid_001()
        content: -> arrows
        section: 'arrows'
        cell: './arrow_004.coffee'
        #content: -> button_005()
        #content: -> text_input_002()
        #content: -> ph_glyph_001()
        #content: -> room_3_1()
        screenHint: screenHint


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
                    focus_cell_selection: @focus_cell_selection
                    change_gig: @change_gig # didn't need to be bound
                    section: @state.section
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

            sidebar
                room_2: @changeContent.bind(@, room_2)
                rule_30: @changeContent.bind(@, rule_30_0)
                room_3_1: @changeContent.bind @, room_3_1
                buttons__grid: @changeContent.bind @, buttons__grid_001
            # @state.screenHintc 'section', @props.section
            #     remove_screenHint: @remove_screenHint#.bind(@)

React.render main(), __react__root__
