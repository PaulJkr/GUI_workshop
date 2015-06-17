
c = -> console.log.apply console, arguments
React= require 'react'
update = require('react/addons').addons.update
{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, ul, li, ol, code, a} = React.DOM
rr = -> React.createFactory(React.createClass.apply(React, arguments))
shortid = require('shortid')

screenHint = rr
    getInitialState: ->
        opacity: 1
    componentDidMount: ->
        setTimeout =>
            interval_0 = setInterval =>
                if @state.opacity <= 0
                    clearInterval interval_0
                else
                    @setState
                        opacity: @state.opacity - .010
            , 20
        , 1000

        setTimeout =>
            @props.remove_screenHint()
        , 10000

    render: ->
        div
            key: 'screen_hint_0'
            style:
                width: 300
                height: 160
                position: 'fixed'
                top: window.innerHeight / 3
                left: window.innerWidth / 3
                fontSize: 30
                fontFamily: 'lucinda'
                color: 'white'
                border: '3px solid grey'
                borderRadius: 4
                padding: 20
                opacity: @state.opacity
            ,
            div
                style:
                    position: 'absolute'
                    top: 0
                    left: 0
                    width: '100%'
                    height: '100%'
                    background: 'darkgrey'
                    opacity: .9
            div
                style:
                    position: 'absolute'
                    width: '100%'
                    height: '100%'
                ,
                h3({key:'screen_hint_1'}, "there is a hidden menu on the side of the screen ===>")

module.exports = -> screenHint