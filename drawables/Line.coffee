class drawjs.Line extends drawjs.Drawable
	
	constructor: (@x0, @y0, @x1, @y1, @radius, @color) ->
		
	
	draw: (canvas) ->
		canvas.drawLine(@)