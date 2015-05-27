


module.exports = ->
  c = console.log.apply console, arguments

  React = require "react"

  {div, h1, h3} = React.DOM

  park: ->
    h3 null, "yes park"
