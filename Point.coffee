class drawjs.Point
	
	constructor: (@x, @y) ->
		
	
	getCopy: () ->
		return new drawjs.Point(@x, @y)
	
	getXTo: (point) ->
		return point.x - @x
	
	getYTo: (point) ->
		return point.y - @y
	
	getVectorTo: (point) ->
		return new Vector(@getXTo(point), @getYTo(point))
	
	getDistanceTo: (point) ->
		return @getVectorTo(point).getLength()
	
	move: (vector) ->
		@x += vector.x
		@y += vector.y