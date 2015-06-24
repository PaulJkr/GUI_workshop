










____________________________
### honey_wasp server


_______________
_june 24_


websocket server.
it runs a redis client,
it has license to create and edit files for components that want to be exported.  to 'hard code', the saved redis selections iow.


there are sets or sections , and each one has cells.
right now we are just rectangles for cells, and as long as the cells
are divs this will remain the case.  so we need to see if we 
can nest svgs as react components without intervening divs.  i think we can.  then we can make aperiodic tilings for the cells. 

the next step is state data design.

the content fed to the root render should be calculated from the content vector.  

right now i think the content vector is [section, cell], those coordinates index dictionaries section to `sections_basket` and cell to section. we could make `section_view` a legitimate cell coordinate, which would allow calculating to show the overall section view for that section.  

for now can put current nav-state to localStorage and query this on reload.  can still have a hard-coded override switch standing by ready to be unncommented.



















___________________
_june 23 2015_
thought about it and i don't want to make a wysiwyg gui builder--kind of inclined to believe that primary interface should be through the code in a numerically creative compositional mindset; however, not only can we provision on-screen interface dials for certain things, we can ad-hoc keyboard combo interfaces to those interfaces, and we can save config data to persistent layer using redis and websocket server, and maybe other kinds of files, just using fs utils..  so, necessarily something with similar functionality to dashku.

for now making a simple node server which will have some various websocket implementations and wrappers (using opportunity to play with and learn some tools in a new context), and persist to redis.


this could just be a massive time waster though, in the sense of time consuming that for each component have to design an interface, decide what of the attributes of the component want to expose to direct manipulation.  

colors would be good, stops in a gradient (also colors ) would be good.  but overall, maybe just a waste of time.

the time saved would be in eliminating reloads , so it could be good for tweaking things that require lots of iterations to get just right.  better to do it ad-hoc then maybe

but design the controls-instrumentation for that process.  

______________________

___________________________
