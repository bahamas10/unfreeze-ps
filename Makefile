NAME = unfreeze-ps

VERSION = $(shell git tag -l | tail -1)
ICON = $(NAME).icns
FILE = $(NAME).sh
APP = $(NAME).app
ZIP = $(NAME)-$(VERSION).app.zip

$(APP): $(FILE) $(ICON)
	mkdir -p $(APP)/Contents/{MacOS,Resources}
	cp $(FILE) $(APP)/Contents/MacOS/$(NAME)
	chmod +x $(APP)/Contents/MacOS/$(NAME)
	cp $(ICON) $(APP)/Contents/Resources/$(ICON)
	sed -e 's/:APPNAME/$(NAME)/' < Info.plist > $(APP)/Contents/Info.plist
	echo $(VERSION) > $(APP)/version.txt

$(ZIP): $(APP)
	zip -r $@ $<

all: $(APP) $(ZIP)

clean:
	rm -rf $(APP)
	rm -f $(ZIP)

.phony: all clean
