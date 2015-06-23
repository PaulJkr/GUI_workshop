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

    getInitialState: ->
        #ncontent: -> buttons__grid()
        content: -> buttons__grid_001()
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
            @state.content?()
            sidebar
                room_2: @changeContent.bind(@, room_2)
                rule_30: @changeContent.bind(@, rule_30_0)
                room_3_1: @changeContent.bind @, room_3_1
                buttons__grid: @changeContent.bind @, buttons__grid
            # @state.screenHint
            #     remove_screenHint: @remove_screenHint#.bind(@)

React.render main(), __react__root__
