module.exports = ->
    c : -> console.log.apply console, arguments

    React: require("react")
    #PureRenderMixin : require('react/addons').addons.PureRenderMixin

    rr : -> React.createFactory(React.createClass.apply(React, arguments))
    shortid : require 'shortid'