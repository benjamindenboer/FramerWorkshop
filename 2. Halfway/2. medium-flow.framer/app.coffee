# 1. PageComponent
# 2. Loop
# 3. ScrollComponents within Loop
# 4. Sketch layers within Scroll.Content
# 5. Add scroll as pages
# 6. directionLock
# 7. contentInset
# 8. navBarShadow
# 9. Click navBar, currentPage scrollTop

# Sketch Import
sketch = Framer.Importer.load "imported/medium"

bg = new BackgroundLayer
	backgroundColor: "white"
	
# This page component holds the horizontally aligned pages
page = new PageComponent
	y: sketch.navBar.height
	height: Screen.height - sketch.navBar.height
	width: Screen.width
	scrollVertical: false