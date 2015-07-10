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
	directionLock: true

# Create 3 scrollable pages
for i in [0...3]
	
	scroll = new ScrollComponent
		size: page.size
		contentInset: bottom: 40
		scrollHorizontal: false
		directionLock: true
		
	sketch["scroll#{i+1}"].superLayer = scroll.content
	
	# The scroll component is added as a page 
	page.addPage(scroll)
	
# Shadow
sketch.navBarShadow.bringToFront()

# Scroll to top when clicking the navBar
sketch.navBar.on Events.Click, -> 
	page.currentPage.scrollToTop()
	
	