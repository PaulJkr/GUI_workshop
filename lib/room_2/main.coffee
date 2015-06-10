

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

    style = (a) ->
        width: 1000
        height: 600
        background: 'lightblue'

    # abs_pos = (a) ->  # might resurrect this for something
    #     position: 'absolute'
    #     width: a.w or 100
    #     height: a.h or 100
    #     top: a.t or ''
    #     left: a.l or ''
    #     bottom: a.b or ''
    #     right: a.r or ''
    #     zIndex: 500

    rr
        getInitialState: ->
            range_0: 40
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
            @setState
                range_0: e.currentTarget.value
        raiseRange: (range_key) ->
            if @state.range isnt 100
                c 'raising range'
                #surr_object = =>
                    #"#{range_key}": parseInt(@state["#{range_key}"]) + 1
                #@setState surr_object()
                    #do => "#{range_key}": parseInt(@state.range_)
                    #range: parseInt(@state.range) + 1
                @setState do => "#{range_key}": parseInt(@state["#{range_key}"]) + 1
        lowerRange: (range_key)->
            if @state.range isnt 0
                surr_object = =>
                    "#{range_key}": parseInt(@state.range_0) - 1
                @setState surr_object()
                    #range: parseInt(@state.range) - 1
                    #"#{zzz()}": parseInt(@state.range) - 1
        render: ->

            div
                style: style()
                ,
                div
                    style:
                        position: 'absolute'
                        top: 50
                        left: 50
                    ,
                    range_dial_2
                        range: @state.range_0
                        rangeChange: @rangeChange.bind @, "range_0"
                        raiseRange: @raiseRange.bind(@, "range_0")
                        lowerRange: @lowerRange.bind(@, "range_0")
                div
                    style:
                        position: 'absolute'
                        top: 100
                        left: 100
                    ,
                    progress_bar_4
                        range: @state.range_0
                        width: 300
                        height: 30

