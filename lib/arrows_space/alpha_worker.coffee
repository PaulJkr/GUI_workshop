


c = -> console.log.apply console, arguments

c "worker is here"


postMessage "have something here"


addEventListener "message", ->
    c "have one on event lister"
    c "internally got messssagy"
    postMessage("another mesaseg")
