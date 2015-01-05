class drawjs.Drawable
	
	draw: (canvas) ->
		console.assert(false, "Drawable.draw(canvas) is an absstract method; must be overwritten.")
	
	animate: (canvas, doneCallback) ->
		console.assert(false, "Drawable.animate(canvas, doneCallback) is an absstract method; must be overwritten.")