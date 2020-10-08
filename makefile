.PHONY: build  
build:
	middleman build

zip:
	zip build.zip build -r

bz: build zip

clean:
	rm -rfv build
	rm -v build.zip

update:
	wget https://github.com/fengyuanchen/viewerjs/raw/master/dist/viewer.min.css -O source/viewer.min.css
	wget https://github.com/fengyuanchen/viewerjs/raw/master/dist/viewer.min.js -O source/viewer.min.js 