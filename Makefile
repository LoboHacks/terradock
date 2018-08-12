.PHONY: all clean release

all: clean release

release: terradock LICENSE README.md
	mkdir -p $(PWD)/release/
	zip $(PWD)/release/terradock.zip terradock LICENSE README.md

clean:
	-rm $(PWD)/release/terradock.zip
