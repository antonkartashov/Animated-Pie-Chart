new BackgroundLayer

b = new Layer
	width: 640
	height: 640
	backgroundColor: "#ecf0f1"
	borderRadius: "50%"
b.center();


a = new Layer
	width: 640
	height: 640
	backgroundColor: "transparent"

a.center();
a.html = "<svg id='svg' width='#{a.width}' height='#{a.height}'></svg>"



anim1 = new Layer x: 0, backgroundColor: "none"
anim2 = new Layer x: 0, backgroundColor: "none"
anim3 = new Layer x: 0, backgroundColor: "none"
anim4 = new Layer x: 0, backgroundColor: "none"



# Snap.svg
$ = Snap '#svg'

sector1 = $.paper.path "M320,320  L640,320 A320,320 0 0,1 640,320"
sector2 = $.paper.path "M320,320  L640,320 A320,320 0 0,1 640,320"
sector3 = $.paper.path "M320,320  L640,320 A320,320 0 0,1 640,320"
sector4 = $.paper.path "M320,320  L640,320 A320,320 0 0,1 640,320"
  
# shadow = $.paper.filter(Snap.filter.shadow(2, 2, 4, "rgb(30, 30, 30)", .01))


# Piechart Function 
piechart = (anim, sector, color) ->
	x1 = 320 + 320 * Math.sin 0
	y1 = 320 - 320 * Math.cos 0
	
	rad2 = Utils.modulate(anim.x, [0, 100], [0, Math.PI * 2]);
	
	if rad2 > Math.PI and rad2 < 2 * Math.PI then sweep1 = 1 else sweep1 = 0 
	if rad2 >= 2 * Math.PI then sweep2 = 0 else sweep2 = 1
	x2 = 320 + 320 * Math.sin rad2
	y2 = 320 - 320 * Math.cos rad2	
	
	sector = $.paper.path("M320,320  L#{x1},#{y1} A320,320 0 #{sweep1},#{sweep2} #{x2},#{y2}")
	sector
		.attr('fill', color)
#		.attr('filter', shadow)

  
	
a.on "click", ->
	anim1.animate
		properties: {x: 100}
		time: .6
		curve: "ease-out"
	
	anim2.animate
		properties: {x: 55}
		time: .5
		curve: "ease-out"
		delay: .2
	
	anim3.animate
		properties: {x: 30}
		time: .4
		curve: "ease-out"
		delay: .4
		
	anim4.animate
		properties: {x: 15}
		time: .3
		curve: "ease-out"
		delay: .6
	
anim1.on "change:x", ->	 
	piechart(anim1, sector1, "#f1c40f")

anim2.on "change:x", ->	 
	piechart(anim2, sector2, "#e67e22")

anim3.on "change:x", ->	 
	piechart(anim3, sector3, "#e74c3c")
	
anim4.on "change:x", ->	 
	piechart(anim4, sector4, "#c0392b")	
	

###


