


##### GUI_workshop

An environment for design and development of UI/UX components in React, using Webpack for reloading.

Right now it's pretty chaotic with no navigation--just it goes to whatever I'm working  on at the time.  This will change.  For now I'm just prototyping a bunch of stuff; will organise it later.

#### to run it:

###### **Things have changed**

Stimulated by demand for all SVG all the time, which is only now starting to be implemented in React, I'm starting to develop on a React fork, and using this repo as a laboratory.  I've done this before, and it's like this: I don't do the `npm link` thing, instead I remove the relevant repo dependency from the package.json and clone my fork manually to the node_modules folder.  In the case of React there is an even more complicated set of build processes to go through, which I'm still learning about.  Long story short, it works for me, and here's how.

1. Clone this repo.  `npm install`

2. Go to node_modules folder and clone 
`git@github.com:Terebinth/react.git` . Fetch the `meddle` branch and switch to it.  `npm install`.  This could take a long, long time.  

3. `grunt build` and also, more importantly, `grunt build:npm-react`.

4. Notice I changed the main.js file in root to point to build/modules/React, which mimics the normal npm installed package (surprised to see how very different this is from a clone of the React repo, which itself is confusingly referred to in its package.json file as the react-tools module) configuration, in which the index.js file points to lib/React; different paths but pointing to the same collection of files.

5. Continue as before.  From GUI_workshop root:
`$ webpack-dev-server --hot`, localhost:8080/gui_workshop.html

Only tested in Firefox, and I know one part at least that uses feature (`Object.assign()`) from ES-6 which as of now (June 15, 2015) Chromium doesn't support.


###### **note**

I removed **react** from package.json file in order to have clones to the active repos for active development.  Still a dependency but needs to be manually added as explained above.


#### todo:

- make a 'safe' branch for quick evaluation publishing of like portfolio

- add a simple server for production portfolio publishing, and push to a free heroku app

- do content