class drawjs.DrawInstructions
	
	constructor: () ->
		@instructions = []
	
	draw: (drawable) ->
		@instructions.push
			type: 'draw'
			drawable: drawable
	
	animate: (drawable) ->
		@instructions.push
			type: 'animate'
			drawable: drawable
	
	animateAndContinue: (drawable) ->
		@instructions.push
			type: 'animateAndContinue'
			drawable: drawable
	
	wait: (milliseconds) ->
		@instructions.push
			type: 'wait'
			milliseconds: milliseconds
	
	execute: (canvas, doAnimate) ->
		@execute2(canvas, doAnimate, 0)
	
	execute2: (canvas, doAnimate, index) ->
		if index == @instructions.length
			# We're done!
		else
			
			instruction = @instructions[index]
			type = instruction.type
			
			executeNext = () =>
				@execute2(canvas, doAnimate, index+1)
			
			switch type
				when 'draw'
					instruction.drawable.draw(canvas)
					executeNext()
				when 'animate'
					if doAnimate
						instruction.drawable.animate(canvas, executeNext)
					else
						instruction.drawable.draw(canvas)
						executeNext()
				when 'animateAndContinue'
					if doAnimate
						instruction.drawable.animate(canvas, doNothing)
					else
						instruction.drawable.draw(canvas)
					executeNext()
				when 'wait'
					if doAnimate
						setTimeout(executeNext, instruction.milliseconds)
					else
						executeNext()
				else
					console.assert(false, "DrawInstructions.execute2(canvas, doAnimate, index): unknown type '"+type+"'.")