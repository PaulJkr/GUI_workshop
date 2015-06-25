

javelins_root_view = require('./lib/javelins_space/main_000_.coffee')()


required__javelins = require.context('./lib/javelins_space/lib', true, /.coffee$/)

javelins_basket = required__javelins.keys().reduce (acc, i) ->
    acc[i] = required__javelins(i)()
    acc
, {name: 'javelins'}

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