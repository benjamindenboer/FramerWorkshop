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