NAME = unfreeze-ps

FILE = $(NAME).sh
APP = $(NAME).app
ZIP = $(NAME)-$(shell git tag -l | tail -1).app.zip

all: clean app zip
clean:
	rm -rf $(APP)
	rm -f *.zip
app:
	mkdir -p $(APP)/Contents/MacOS
	cp $(FILE) $(APP)/Contents/MacOS/$(NAME)
	chmod +x $(APP)/Contents/MacOS/$(NAME)

zip:
	zip -r $(ZIP) $(APP)
