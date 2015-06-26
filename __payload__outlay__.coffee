
c = -> console.log.apply console, arguments


section_views = {}

components_baskets_indexed_by_section = {}





javelins_root_view = require('./lib/javelins_space/main_000_.coffee')()
c 'what'

required__javelins = require.context('./lib/javelins_space/lib', true, /.coffee$/)

javelins_basket = required__javelins.keys().reduce (acc, i) ->
    acc[i] = required__javelins(i)()
    acc
, {name: 'javelins'}

components_baskets_indexed_by_section['javelins'] = javelins_basket
section_views['javelins'] = javelins_root_view




arrows_root_view = require('./lib/arrows_grid/main_000_.coffee')()
required_arrows = require.context('./lib/arrows_grid/lib', true, /.coffee$/)
arrows_basket = required_arrows.keys().reduce (acc, i) ->
    acc[i] = required_arrows(i)()
    acc
, {name: 'arrows'}


components_baskets_indexed_by_section['arrows'] = arrows_basket
section_views['arrows'] = arrows_root_view





#-------------------------------------______________
#--------------------_______________________----------------

module.exports = ->
    section_views: section_views
    components_baskets_indexed_by_section: components_baskets_indexed_by_section
