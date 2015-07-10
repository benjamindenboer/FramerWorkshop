# Sketch Import
sketch = Framer.Importer.load "imported/Artboards"

# We're setting up the artboards here. 
# First, they're all made visible and we position each next to its previous artboard.
canvas = new BackgroundLayer backgroundColor: "#1B1C20"
sketch.artboardB.visible = true
sketch.artboardC.visible = true
sketch.artboardB.x = sketch.artboardA.maxX
sketch.artboardC.x = sketch.artboardB.maxX

# For a persistent navBar, we set its superLayer (parent layer) to the device.
# Now, it's no longer contained within artboardA.
sketch.navBar.superLayer = Framer.Device.screen

# We store some variables to use later on.
screenWidth = Framer.Device.screen.width
screenHeight = Framer.Device.screen.height
startPosition = 0

# We set up a container holding all of our artboards.
# Its width is set to 3x the screenWidth, because we have 3 screens to swipe between.
screenContainer = new Layer width:(screenWidth*3), height:screenHeight, backgroundColor: "transparent"

# Make it only horizontally draggable
screenContainer.draggable.enabled = true
screenContainer.draggable.speedY = 0

# Adding states for each screen and its position
screenContainer.states.add 
	screen1: {x:0}
	screen2: {x:-screenWidth}
	screen3: {x:-screenWidth*2}
	
# We're defining a nice bouncy animation curve and switch to the first screen.
screenContainer.states.animationOptions = curve: "spring(200,20,0)"
screenContainer.states.switch "screen1"

# Storing all of our artboards within an array
screens = [sketch.artboardA, sketch.artboardB, sketch.artboardC]

# We're looping over our array and placing each artboard within our container
for screen in screens
	screen.superLayer = screenContainer 
	
# Grabbing the startPosition of each dragging instance
screenContainer.on Events.DragStart, -> startPosition = this.x

# When we release, we calculate our dragging distance and set the states accordingly.
screenContainer.on Events.DragEnd, ->
	distance = startPosition - this.x
	startState = this.states.state
	
	# If we haven't dragged past 1/4th of our screenWidth, stay at screen1.
	if Math.abs(distance) < (750/4) then this.states.switch startState
	else 
		# If we're dragging to the right and we're not at the last screen, go to next.
		if distance > 0 and startState isnt "screen3" then this.states.next()
		# If we're dragging to the left and we're not at the first screen, go to previous.
		else if distance < 0 and startState isnt "screen1" then this.states.previous()
		# Otherwise, stay at our current screen
		else this.states.switch startState 