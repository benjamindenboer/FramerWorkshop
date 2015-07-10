# Sketch Import
sketch = Framer.Importer.load "imported/view-transition"

# Wrap image in ScrollComponent
scroll = ScrollComponent.wrap(sketch.group)
scroll.scrollHorizontal = false

# Add a little padding for the navigation bar
scroll.contentInset = {bottom: 90}

# Write post layer
post = new Layer 
	width: Screen.width
	height: Screen.height
	y: Screen.height 
	image: sketch.post.image
	
# Cancel button
cancel = new Layer 
	x: 8, y: 40
	width: 140, height: 80
	backgroundColor: null
	superLayer: post 
	
# Prevent dragging beyond top
scroll.on Events.Scroll, ->
	if scroll.scrollY <= 0 then scroll.scrollY = 0

# Push post-view 
sketch.write.on Events.Click, ->
	post.animate 
		properties:
			y: 0
		curve: "spring(400,35,0)"

# Cancel post-view	
cancel.on Events.Click, ->
	post.animate 
		properties:
			y: Screen.height
		curve: "spring(400,35,0)"