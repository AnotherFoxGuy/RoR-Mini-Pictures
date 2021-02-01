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
	wget https://cdn.statically.io/gh/fengyuanchen/viewerjs/master/dist/viewer.min.css -O source/viewer.min.css
	wget https://cdn.statically.io/gh/fengyuanchen/viewerjs/master/dist/viewer.min.js -O source/viewer.min.js 
	wget https://cdn.statically.io/gh/foundation/foundation-sites/master/dist/css/foundation.min.css -O source/foundation.min.css
	wget https://cdn.statically.io/gh/krisk/Fuse/master/dist/fuse.min.js  -O source/fuse.min.js