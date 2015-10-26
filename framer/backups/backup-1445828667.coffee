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


# Snap.svg
$ = Snap '#svg'

sector1 = $.paper.path "M320,320 L320,0 A320,320 0 1,0 320,0 A320,320 0 1,0 320,0"



anim1 = new Layer x: 0, backgroundColor: "none"

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
		

