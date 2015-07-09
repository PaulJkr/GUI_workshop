






i noticed the svg api presentation on mdn is very solid example of restful service, with stability benefits and gui drawbacks.  like the properties should be in collapsed elements that can be expanded by mouseover controls instead of having to open 20 tabs just to understand some specific configuration of e.g. the filter operation.

but the api itself is professionally designed and noticed that they did their utmost to share properties between element types, ;;; we should start thinking about if not actually implementing (it's an optimisation after all) standardisation of props types and maybe factory generators for a lot of this stuff.  actually is prerequisite to the efficiency needed to do anything as complex as a full-featured wysiwyg / ide gui builder, which is where things seem to be headed recently with sidewinder-003 and the onscreen svg `path` editing.  right now we're working on the control panel which is now text based, and then a side project to develop the custom controls , buttons and so forth to create, read, update, and delete commands.  anything in the vector that has a vector correspondence on screen, like a `M` move-to command can have a draggable anchor.  as in sidewinder-002 reverse transforms to get the mouse coords back into ideal (-100, 100) coords.