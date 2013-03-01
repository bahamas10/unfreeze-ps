NAME = unfreeze-ps

VERSION = $(shell git tag -l | tail -1)
ICON = $(NAME).icns
FILE = $(NAME).sh
APP = $(NAME).app
ZIP = $(NAME)-$(VERSION).app.zip

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
	echo $(VERSION) > $(APP)/version.txt
zip:
	zip -r $(ZIP) $(APP)
