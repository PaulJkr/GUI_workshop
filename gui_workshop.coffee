# gui_workshop

React = require("react")

c = -> console.log.apply console, arguments

c "react is ", React

rr = -> React.createFactory(React.createClass.apply(React, arguments))

draggable = require('./draggable.coffee')().draggable_000

x = require('./test_module.coffee')()

{div, h1, h3} = React.DOM

curtain = rr
  render: ->
    div null, "hey again"


imp_x = rr
  render: ->
    div
      style:
        borderRadius: 4
        position: 'absolute'
        backgroundImage: 'url(/adom.jpg)'
        width: '99%'
        height: '99%'
      ,
      draggable(curtain)
        initial_position: {x: 20, y: 20}







render = -> React.render imp_x(), document.body
render()



