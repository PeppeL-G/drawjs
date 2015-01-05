Package.describe({
	name: 'peppelg:drawjs',
	summary: 'Animate drawings with a pen on canvases.',
	version: '1.0.0',
	name: "peppelg:drawjs",
	git: 'https://github.com/PeppeL-G/drawjs.git'
})

Package.onUse(function(api) {
	
	api.versionsFrom('1.0.2.1')
	
	api.use([
		'coffeescript',
		'peppelg:do-nothing'
	], 'client')
	
	api.addFiles([
		'drawjs.coffee',
		'Canvas.coffee',
		'Point.coffee',
		'Vector.coffee',
		'drawables/Drawable.coffee',
		'drawables/Line.coffee',
		'packageVariables.js'
	], 'client')
	
	api.export([
		'drawjs'
	], 'client')
	
})