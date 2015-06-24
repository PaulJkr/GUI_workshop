arrows = require('./lib/arrows_grid/main_000_.coffee')()
require_arrows = require.context('./lib/arrows_grid/lib', true, /.coffee$/)
arrows_basket = require_arrows.keys().reduce (acc, i) ->
    acc[i] = require_arrows(i)()
    acc
, {name: 'arrows'}

sections_basket = {}
sections_basket['arrows'] = arrows_basket

charta = {}
charta['arrows'] = arrows

module.exports = ->
    require_arrows: require_arrows
    arrows: arrows
    arrows_basket: arrows_basket
    sections_basket: sections_basket
    charta: charta