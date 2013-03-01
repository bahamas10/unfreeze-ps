NAME = unfreeze-ps

ICON = $(NAME).icns
FILE = $(NAME).sh
APP = $(NAME).app
ZIP = $(NAME)-$(shell git tag -l | tail -1).app.zip

all: clean app zip
clean:
	rm -rf $(APP)
	rm -f *.zip
app:
	mkdir -p $(APP)/Contents/{MacOS,Resources}
	cp $(FILE) $(APP)/Contents/MacOS/$(NAME)
	chmod +x $(APP)/Contents/MacOS/$(NAME)
	cp $(ICON) $(APP)/Contents/Resources/$(ICON)
	sed -e 's/:APPNAME/$(NAME)/' < Info.plist > $(APP)/Contents/Info.plist
zip:
	zip -r $(ZIP) $(APP)
