# gui_workshop

React = require("react")

c = -> console.log.apply console, arguments

c "react is ", React



x = require('./test_module.coffee')()

{div, h1, h3} = React.DOM

imp = ->
  div null,
    h1 null, "hello gui_workshop"
    x.park()


amp = document.getElementById "g1"

render = -> React.render imp(), amp

render()



