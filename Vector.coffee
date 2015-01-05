class drawjs.Vector
	
	constructor: (@x, @y) ->
		
	
	getAngle: () ->
		return Math.atan2(@y, @x)
	
	getLength: () ->
		return Math.sqrt(@x*@x + @y*@y)
	
	scale: (factor) ->
		@x *= factor
		@y *= factor