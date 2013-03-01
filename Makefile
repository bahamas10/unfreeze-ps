NAME = unfreeze-ps

FILE = $(NAME).sh
APP = $(NAME).app
ZIP = $(NAME)-$(shell git tag -l | tail -1).app.zip

all: clean bundle
clean:
	rm -rf $(APP)
	rm -f *.zip
bundle:
	mkdir -p $(APP)/Contents/MacOS
	mv $(FILE) $(APP)/Contents/MacOS/$(NAME)
	chmod +x $(APP)/Contents/MacOS/$(NAME)
	zip -r $(ZIP) $(APP)
