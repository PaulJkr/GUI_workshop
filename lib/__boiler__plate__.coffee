


# todo :: make some factory functions for some things.


module.exports = ->
    React = require("react")

    c : -> console.log.apply console, arguments
    React: React
    rr : -> React.createFactory(React.createClass.apply(React, arguments))
    shortid : require 'shortid'
    assign: -> Object.assign.apply(Object, arguments)
    update : require('react/addons').addons.update
    __react__root__ : document.getElementById "__react__root__"


# usage:
# {c, React, rr, shortid, assign, __react__root__} = require('./lib/__boiler__plate__.coffee')()





# this kind of thing could go in boilerplate too if it not teh suck
# {abs_position_wrapper, draggable} = require('./lib/position_and_draggable_wrappers.coffee')() 