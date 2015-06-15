


c = -> console.log.apply console, arguments
React = require("react")
{p, div, h1, h2, h3, h4, h5, h6, span, svg, defs, linearGradient, circle, stop, ul, li, ol, code, a, input} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))

progress_bar = require('./progress_bar_2_.coffee')()
progress_bar_3 = require('./progress_bar_3_.coffee')()
#range_dial = require('./range_dial.coffee')()
progress_bar_4 = require('./progress_bar_4_.coffee')()
progress_bar_5 = require('./progress_bar_5_.coffee')()
range_dial_2 = require('./range_dial_2_.coffee')()
range_dial_3 = require('./range_dial_3_.coffee')()

shortid = require 'shortid'

style = (a) ->
    width: 1024
    height: 768
    overflow: 'hidden'
    #background: 'linear-gradient(135deg, rgba(25, 25, 255, 0), rgba(255, 25, 255, 0.8))'
    #background: 'black'


style_2 = (a) ->
    width: '100%'
    height: '100%'
    background: 'url(../../static_assets/poster_3.png), linear-gradient(135deg, rgba(25, 25, 255, 0), rgba(255, 25, 255, 0.8)), url(../../static_assets/adom.jpg)'
    backgroundRepeat: 'no-repeat, no-repeat, no-repeat'
    backgroundPosition: 'left, right, left'
    backgroundSize: '200px 300px, 100% 100%, 400px 100px'
    overflow: 'hidden'


style_3 = (a) ->
    zIndex: 50
    width: '100%'
    height: '100%'
    background: 'url(../../static_assets/poster_3.png)'
    opacity: 1

range_b = shortid.generate()
main = rr
    getInitialState: ->
        range_0: 40
        "#{range_b}": 60
        progress_bar_basket: {} # could add to this and then map out of it.
        # but this could be a prop instead.  i think it should be state.
        # i'll think about it later.

    componentDidMount: ->

    rangeChange: (range_key, percentage) ->
        # the interface should take a percentage instead of an e event
        # because we have other ways of changing that don't end up with events
        # like the touch the bar needs to parse the event differently.

        if Object.keys(percentage).indexOf('currentTarget') isnt -1
            @setState do => "#{range_key}": percentage.currentTarget.value
        else
            @setState do => "#{range_key}": percentage
    raiseRange: (range_key) ->
        if @state.range isnt 100
            @setState do => "#{range_key}": parseInt(@state["#{range_key}"]) + 1
    lowerRange: (range_key)->
        if @state.range isnt 0
            @setState do => "#{range_key}": parseInt(@state["#{range_key}"]) - 1
    render: ->
        div
            style: style()
            ,
            div
                style: style_2()
                ,
            # div
            #     style: style_3()
            #     ,
            #@progress_bar_basket.map
            div
                style:
                    overflow: 'hidden'
                , #range_0
                div
                    style:
                        overflow: 'hidden'
                        position: 'absolute'
                        top: 50
                        left: 600
                    ,
                    range_dial_3
                        range: @state.range_0
                        rangeChange: @rangeChange.bind @, "range_0"
                        raiseRange: @raiseRange.bind @, "range_0"
                        lowerRange: @lowerRange.bind @, "range_0" 
                div
                    style:
                        position: 'absolute'
                        top: 100
                        left: 100
                    ,
                    progress_bar_5
                        range: @state.range_0
                        width: 300
                        height: 20
            div #range_1 , ... could use shortid for these instead
                style:
                    position: 'absolute'
                    left: 200
                    top: 200
                ,
                    range_dial_2#()
                        key: range_b
                        range: @state["#{range_b}"]
                        rangeChange: @rangeChange.bind @, "#{range_b}"
                        raiseRange: @raiseRange.bind @, "#{range_b}"
                        lowerRange: @lowerRange.bind @, "#{range_b}"
                        style:
                            position: 'absolute'
                div
                    style:
                        position: 'absolute'
                        top: 100
                        left: 100
                    ,
                    progress_bar_5
                        rangeChange: @rangeChange.bind @, "#{range_b}"
                        range: @state["#{range_b}"]
                        width: 300
                        height: 16


module.exports = -> main