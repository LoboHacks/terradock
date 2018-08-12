all: clean init release

init:
	mkdir -p $(PWD)/release/

release: init $(PWD)/terradock $(PWD)/LICENSE $(PWD)/README.md
	zip $(PWD)/release/terradock.zip terradock LICENSE README.md

clean:
	-rm $(PWD)/release/terradock.zip
