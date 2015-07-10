# 1. BackgroundLayer
# 2. Layer Properties, Centering
# 3. Draggable
# 4. Constraints Layer, Frame
# 5. Set Constraints, Events
# 6. States / Animation

# Set background
bg = new BackgroundLayer backgroundColor: "#28affa"

# Create layer
layerA = new Layer
	backgroundColor: "#fff"
	borderRadius: 4

layerA.center()

# Enable dragging
layerA.draggable.enabled = true

# Create constraints layer
constraints = new Layer 
	backgroundColor: "rgba(255,255,255,0.3)"
	width: 250
	height: 250
	borderRadius: 8
	
constraints.center()

# Set constraints
# Frame: x, y, width, height 
layerA.draggable.constraints = constraints.frame