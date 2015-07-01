
c = -> console.log.apply console, arguments


section_views = {}

components_baskets_indexed_by_section = {}


# todo:: DRY process these calls  :: for looping this didn't work
# because webpaack likes to know everything at compile time otherwise needs context
# generatino which i don't want to mess with righth now.


javelins_root_view = require('./lib/javelins_space/main_000_.coffee')()
required__javelins = require.context('./lib/javelins_space/lib', true, /.coffee$/)
javelins_basket = required__javelins.keys().reduce (acc, i) ->
    acc[i] = required__javelins(i)()
    acc
, {name: 'javelins'}
components_baskets_indexed_by_section['javelins'] = javelins_basket
section_views['javelins'] = javelins_root_view

arrows_root_view = require('./lib/arrows_space/main_000_.coffee')()
required_arrows = require.context('./lib/arrows_space/lib', true, /.coffee$/)
arrows_basket = required_arrows.keys().reduce (acc, i) ->
    acc[i] = required_arrows(i)()
    acc
, {name: 'arrows'}
components_baskets_indexed_by_section['arrows'] = arrows_basket
section_views['arrows'] = arrows_root_view

sidewinders_root_view = require('./lib/sidewinders_space/main_000_.coffee')()
required_sidewinders = require.context('./lib/sidewinders_space/lib', true, /.coffee$/)
sidewinders_basket = required_sidewinders.keys().reduce (acc, i) ->
    acc[i] = required_sidewinders(i)()
    acc
, {name: 'arrows'}
components_baskets_indexed_by_section['sidewinders'] = sidewinders_basket
section_views['sidewinders'] = sidewinders_root_view


#-------------------------------------______________
#--------------------_______________________----------------

module.exports = ->
    section_views: section_views
    components_baskets_indexed_by_section: components_baskets_indexed_by_section
