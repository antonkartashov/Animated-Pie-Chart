back = new BackgroundLayer
r = 400

b = new Layer
	width: r, height: r
	backgroundColor: "#ecf0f1", borderRadius: "50%"

a = new Layer
	width: r + 20, height: r + 20
	backgroundColor: "transparent"

a.html = "<svg id='svg' width='#{a.width + 20}' height='#{a.height + 20}'><svg id='svg1' width='#{a.width}' height='#{a.height}' x='10' y='10'></svg></svg>"
a.center()
b.center()

$ = Snap '#svg1' 

# Functions
sector = (color) ->
	sec = $.paper.path "#{r / 2}, #{r / 2}"
	sec	
		.attr('fill', color)
	return sec

animatic = (sec) ->
	anim = new Layer x: 0, backgroundColor: "none"
	anim.states.add full: { x: 100 }
	anim.states.animationOptions = { time: 0 }
	anim.on "change:x", -> piechart(anim, sec)
	return anim

piechart = (animatic, sector) ->
	
	x1 = (r / 2) + (r / 2) * Math.sin 0 
	y1 = (r / 2) - (r / 2) * Math.cos 0 
	
	radian = Utils.modulate animatic.x, [0, 100], [0, Math.PI * 2]
	
	x2 = (r / 2) + (r / 2) * Math.sin radian 
	y2 = (r / 2) - (r / 2) * Math.cos radian 
	
	if radian <= Math.PI
		sector.animate {
			d: "M#{r / 2},#{r / 2}  L#{x1},#{y1}  A#{r / 2},#{r / 2} 0 0,1 #{x2},#{y2}"
			
		}, 0
	else 
		sector.animate {
			d: "M#{r / 2},#{r / 2}  L#{x1},#{y1}  A#{r / 2},#{r / 2} 0 0,1 #{r / 2},#{r}  A#{r / 2},#{r / 2} 0 0,1 #{x2},#{y2}"
		}, 0
	
go = (animatic, percent) ->
	
		animatic.animate
			properties: {x: percent}
			time: .4 - animatic.x / 1000, curve: "ease-out"
	


# Data
sector1 = sector("#f1c40f")
animatic1 = animatic(sector1)

sector2 = sector("#e67e22")
animatic2 = animatic(sector2)

sector3 = sector("#e74c3c")
animatic3 = animatic(sector3)

sector4 = sector("#c12a63")
animatic4 = animatic(sector4)

sector5 = sector("#7a3eb2")
animatic5 = animatic(sector5)

i = 0
back.on "click", ->
	if i is 0
		go(animatic1, 100)
		go(animatic2, 75)
		go(animatic3, 50)
		go(animatic4, 25)
		go(animatic5, 12)
	else if i is 1
		go(animatic1, 50)
		go(animatic2, 34)
		go(animatic3, 20)
		go(animatic4, 10)
		go(animatic5, 4)
	else if i is 2
		go(animatic1, 80)
		go(animatic2, 20)
		go(animatic3, 6)
		go(animatic4, 4)
		go(animatic5, 2)
	else if i is 3
		go(animatic1, 100)
		go(animatic2, 95)
		go(animatic3, 85)
		go(animatic4, 72)
		go(animatic5, 54)
	
	i++
	if i is 4 then i = 0
	
	

go(animatic1, 65)
go(animatic2, 35)
go(animatic3, 20)
go(animatic4, 8)
go(animatic5, 3)
