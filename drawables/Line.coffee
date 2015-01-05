class drawjs.Line extends drawjs.Drawable
	
	constructor: (x0, y0, x1, y1, @penRadius, @color) ->
		@p0 = new Point(x0, y0)
		@p1 = new Point(x1, y1)
	
	draw: (canvas, doAnimate) ->
		if doAnimate
			
			vector = @p0.getVectorTo(@p1)
			sublineLength = 2 # TODO: this shouldn't be hard coded.
			lineLength = vector.getLength()
			numberOfSubLines = Math.floor(lineLength / sublineLength)
			vector.scale(1/numberOfSubLines)
			@draw2(canvas, doAnimate, @p0, vector, numberOfSubLines)
			
		else
			canvas.drawLine(@)
	
	draw2: (canvas, doAnimate, start, movement, numberOfSublinesLeft) ->
		
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
			setTimeout =>
				@draw2(canvas, doAnimate, end, movement, numberOfSublinesLeft-1)
			, 50 # TODO: this shouldn't be hard coded.