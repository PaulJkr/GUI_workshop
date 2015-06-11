

module.exports = ->
    c = -> console.log.apply console, arguments
    React = require("react")
    {p, div, h1, h2, h3, h4, h5, h6, span, svg, defs, linearGradient, circle, stop, ul, li, ol, code, a, input} = React.DOM
    rr = -> React.createFactory(React.createClass.apply(React, arguments))

    progress_bar = require('./progress_bar_2_.coffee')()
    progress_bar_3 = require('./progress_bar_3_.coffee')()
    #range_dial = require('./range_dial.coffee')()
    progress_bar_4 = require('./progress_bar_4_.coffee')()
    range_dial_2 = require('./range_dial_2_.coffee')()

    shortid = require 'shortid'

    style = (a) ->
        width: 1000
        height: 700
        #background: 'linear-gradient(135deg, rgba(25, 25, 255, 0), rgba(255, 25, 255, 0.8))'
        #background: 'black'


    style_2 = (a) ->
        width: '100%'
        height: '100%'
        background: 'url(../../static_assets/poster_3.png), linear-gradient(135deg, rgba(25, 25, 255, 0), rgba(255, 25, 255, 0.8)), url(../../static_assets/adom.jpg)'
        #background: 'url(../../static_assets/adom.jpg)'
        backgroundRepeat: 'no-repeat, no-repeat, no-repeat'
        backgroundPosition: 'left, right, left'
        backgroundSize: '200px 300px, 100% 100%, 400px 100px'


    style_3 = (a) ->
        zIndex: 50
        width: '100%'
        height: '100%'
        background: 'url(../../static_assets/poster_3.png)'
        opacity: 1

    range_b = shortid.generate()
    rr
        getInitialState: ->
            range_0: 40
            "#{range_b}": 60
        # autoShowoff: -> # need to rewrite this for here in parent's container func
        #     dir_up = on
        #     inc = 4
        #     setInterval =>
        #         if dir_up is on and @state.range < 100
        #             @setState
        #                 range: @state.range += inc
        #         else if @state.range >= 100
        #             dir_up = off
        #             @setState
        #                 range: 100 - inc
        #         else if dir_up is off and @state.range > 0
        #             @setState
        #                 range: @state.range -= inc
        #         else if @state.range <= 0
        #             dir_up = on
        #             @setState
        #                 range: inc
        #     , 20
        componentDidMount: ->
            #@autoShowoff()
        rangeChange: (range_key, e) ->
            @setState do => "#{range_key}": e.currentTarget.value
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
                div null, #range_0
                    div
                        style:
                            position: 'absolute'
                            top: 50
                            left: 50
                        ,
                        range_dial_2
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
                        progress_bar_4
                            range: @state.range_0
                            width: 300
                            height: 20
                div #range_1 , ... could use shortid for these instead
                    style:
                        position: 'absolute'
                        left: 200
                        top: 200
                    ,
                        range_dial_2
                            key: range_b
                            range: @state["#{range_b}"]
                            rangeChange: @rangeChange.bind @, "#{range_b}"
                            raiseRange: @raiseRange.bind @, "#{range_b}"
                            lowerRange: @lowerRange.bind @, "#{range_b}" 
                    div
                        style:
                            position: 'absolute'
                            top: 100
                            left: 100
                        ,
                        progress_bar_4
                            range: @state["#{range_b}"]
                            width: 300
                            height: 16

