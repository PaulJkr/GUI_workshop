

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

main = rr

    remove_screenHint: ->
        @setState
            screenHint: -> #nothing not null

    changeContent: ->
        @setState
            content: arguments[0]

    getInitialState: ->
        content: -> buttons__grid()#room_3_1()
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
            @state.screenHint
                remove_screenHint: @remove_screenHint#.bind(@)

React.render main(), __react__root__
