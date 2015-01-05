class drawjs.Line extends drawjs.Drawable
	
	constructor: (x0, y0, x1, y1, @penRadius, @color) ->
		@p0 = new Point(x0, y0)
		@p1 = new Point(x1, y1)
	
	draw: (canvas) ->
		canvas.drawLine(@)
	
	animate: (canvas) ->
		vector = @p0.getVectorTo(@p1)
		sublineLength = 2 # TODO: this shouldn't be hard coded.
		lineLength = vector.getLength()
		numberOfSubLines = Math.floor(lineLength / sublineLength)
		vector.scale(1/numberOfSubLines)
		@animate2(canvas, @p0, vector, numberOfSubLines)
	
	animate2: (canvas, start, movement, numberOfSublinesLeft) ->
		
		if numberOfSublinesLeft == 0
			end = @p1
		else
			end = start.getCopy()
			end.move(movement)
		
		subline = new Line(start.x, start.y, end.x, end.y, @penRadius, @color)
		
		canvas.drawLine(subline)
		
		if numberOfSublinesLeft == 0
			# We're done!
		else
			
			animateNext = =>
				@animate2(canvas, end, movement, numberOfSublinesLeft-1)
			
			setTimeout(animateNext, 50) # TODO: this shouldn't be hard coded.