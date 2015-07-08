#----------------------------------------------
# monkey patch from
# https://gist.github.com/akre54/80eaa63762ea499029f0
#--------...... didn't work maybe another 
# doesn't work maybe some env change needed -- it's a different 
# developmental context it's used in.

ReactDOM = require 'react/build/modules/ReactDOM'
ReactElement = require 'react/build/modules/ReactElement'
ReactElementValidator = require 'react/build/modules/ReactElementValidator'
SVGDOMPropertyConfig = require 'react/build/modules/SVGDOMPropertyConfig'
DOMProperty = require 'react/build/modules/DOMProperty'
MUST_USE_ATTRIBUTE = DOMProperty.injection.MUST_USE_ATTRIBUTE


# createFactory = if __DEV__?
#     ReactElementValidator.createFactory
#   else
#     ReactElement.createFactory

createFactory = ReactElement.createFactory

SVGDOMPropertyConfig.Properties.mask = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.filter = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.stdDeviation = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.result = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.mode = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.in = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.in2 = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.x = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.y = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.rx = MUST_USE_ATTRIBUTE
SVGDOMPropertyConfig.Properties.ry = MUST_USE_ATTRIBUTE
    
ReactDOM.filter = createFactory 'filter'
ReactDOM.feGaussianBlur = createFactory 'feGaussianBlur'
ReactDOM.feBlend = createFactory 'feBlend'
ReactDOM.feOffset = createFactory 'feOffset'
ReactDOM.feMerge = createFactory 'feMerge'
ReactDOM.feMergeNode = createFactory 'feMergeNode'
ReactDOM.foreignObject = createFactory 'foreignObject'