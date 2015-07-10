# Sketch Import
sketch = Framer.Importer.load "imported/Artboards"
new BackgroundLayer backgroundColor: "#1B1C20"

# All artboards are made visible
sketch.artboardB.visible = true
sketch.artboardC.visible = true

# For a persistent navBar, we set its superLayer (parent layer) to the device. Now, it's no longer contained within artboardA.
sketch.navBar.superLayer = Framer.Device.screen

# Wrap the first artboard within a PageComponent
pages = PageComponent.wrap(sketch.artboardA)
pages.scrollVertical = false

# Add the other artboards as pages
pages.addPage(sketch.artboardB)
pages.addPage(sketch.artboardC)