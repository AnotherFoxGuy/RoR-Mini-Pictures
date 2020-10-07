.PHONY: build  
build:
	middleman build

zip:
	zip build.zip build -r

bz: build zip

clean:
	rm -rfv build
	rm -v build.zip