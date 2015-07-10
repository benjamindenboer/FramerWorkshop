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
# constraints = new Layer 
# 	backgroundColor: "rgba(255,255,255,0.3)"
# 	width: 250
# 	height: 250
# 	borderRadius: 8