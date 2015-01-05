# The coordinate system looks like this (after transformations in setSize):

#        y
#        ^
# height-|
#        |
#        |
#      0-+-------> x
#        |      |
#        0    width

class drawjs.Canvas
	
	constructor: (@canvas, @width, @height, @color) ->
		@setSize()
		@clear()
	
	# This method should be called when the canvas element is resized.
	# The resize event isn't executed on elements (only the window object),
	# otherwise it would be optimal to listen for that event instead.
	setSize: () ->
		
		@canvas.setAttribute('width',  @canvas.clientWidth)
		@canvas.setAttribute('height', @canvas.clientHeight)
		
		@context = @canvas.getContext("2d")
		
		# Transform it.
		scaleX =  @canvas.clientWidth /@width
		scaleY = -@canvas.clientHeight/@height
		@context.scale(scaleX, scaleY)
		@context.translate(0, -@height)
		
		# Make it look like one draws with a pen.
		@context.lineCap = "round"
	
	clear: () ->
		@context.fillStyle = @color
		@context.fillRect(0, 0, @width, @height)