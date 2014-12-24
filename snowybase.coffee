class Flake
	constructor: () ->
		@initialize()
	Flake.prototype = new createjs.Container
	Flake::Container_initialize = Flake::initialize
	Flake::initialize = ()->
		@Container_initialize()
		g = new createjs.Graphics()
		g.beginFill 'white'
		g.drawCircle 0,0,5
		s = new createjs.Shape g

		bf = new createjs.BlurFilter 5,5,1
		s.filters = [bf]
		b = bf.getBounds()
		s.cache -5+b.x,-5+b.y,10+b.width,10+b.height
		
		@xSpeed = 0
		@vel = 0
		@addChild s

class Snowy
	speed = 2
	flakesNumber = 500
	
	constructor: (_name) ->
		name = _name ? 'snowyCanvas'
		w = window.innerWidth
		h = window.innerHeight
		@flakes = []
		@stage = new createjs.Stage name
		@stage.canvas.width = w
		@stage.canvas.height = h

		createjs.Ticker.setFPS 60
		createjs.Ticker.addEventListener 'tick', @handleTick

		for i in [0..flakesNumber]
			flake = new Flake
			flake.vel = Math.random() * speed + 0.5
			flake.xSpeed = Math.random() * 90
			flake.scaleX = (Math.random() * 1) + 0.3
			flake.scaleY = flake.scaleX
			flake.alpha = Math.random()
			flake.x = Math.random() * w
			flake.y = 0
			@stage.addChild flake
			@flakes.push flake

		@stage.update()
	fall: =>
		for i in [0...@flakes.length]
			@flakes[i].xSpeed++
			@flakes[i].x += Math.sin(@flakes[i].xSpeed/25)
			@flakes[i].y += @flakes[i].vel
			if @flakes[i].y > @stage.canvas.height
				@flakes[i].x = Math.random() * @stage.canvas.width
				@flakes[i].y = 0
	handleTick: =>
		@fall()
		@stage.update()
	window.Snowy = Snowy