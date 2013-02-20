NAME = unfreeze-ps

FILE = $(NAME).nw
APP = $(NAME).app
INFO = $(APP)/Contents/Info.plist
ZIP = $(NAME)-`json version < package.json`.app.zip

all: clean zip bundle
clean:
	rm -f $(FILE)
	rm -rf $(APP)
zip:
	zip -r $(FILE) *
bundle:
	cp -r /Applications/node-webkit.app $(APP)
	mv $(FILE) $(APP)/Contents/Resources
	sed -i '' 's/>node-webkit/>$(NAME)/' $(INFO)
	mv $(APP)/Contents/MacOS/node-webkit $(APP)/Contents/MacOS/$(NAME)
	zip -r $(ZIP) $(APP)
