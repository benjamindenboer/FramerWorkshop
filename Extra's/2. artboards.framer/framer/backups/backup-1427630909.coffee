# Sketch Import
sketch = Framer.Importer.load "imported/Artboards"


sketch.artboardB.visible = true
pages = PageComponent.wrap(sketch.artboardA)
	
pages.nextPage("right", sketch.artboardB)