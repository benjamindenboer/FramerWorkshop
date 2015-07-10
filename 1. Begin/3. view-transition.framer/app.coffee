# Sketch Import
sketch = Framer.Importer.load "imported/view-transition"

# Wrap image in ScrollComponent
scroll = ScrollComponent.wrap(sketch.group)

# scroll.scrollHorizontal = false
# scroll.contentInset = {bottom: 90}

