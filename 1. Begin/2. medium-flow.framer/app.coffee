# Sketch Import
sketch = Framer.Importer.load "imported/medium"

bg = new BackgroundLayer
	backgroundColor: "white"
	
# This page component holds the horizontally aligned pages
# page = new PageComponent
# 	y: sketch.navBar.height
# 	height: Screen.height - sketch.navBar.height
# 	width: Screen.width
# 	scrollVertical: false
# 	directionLock: true