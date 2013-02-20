FILE = unfreeze-ps.nw
APP = unfreeze-ps.app

all: clean zip bundle
clean:
	rm -f $(FILE) $(APP)
zip:
	zip -r $(FILE) *
bundle:
	cp -r /Applications/node-webkit.app $(APP)
	mv $(FILE) $(APP)/Contents/Resources

