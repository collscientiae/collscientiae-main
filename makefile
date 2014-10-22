# absolute paths, necessary because we call it in a subdir
MKDOC = collscientiae
THEMES = themes
SOURCE=doc
TARGET=www

.PHONY = build clean style test update

build:
	make -C ${THEMES}
	cd ${MKDOC} && \
    python -m ${MKDOC}.${MKDOC} \
    ../${SOURCE} ../${THEMES}/sage ../${TARGET}

clean:
	#cd $(TARGET) && find . -mindepth 1 ! -wholename "./.git*" -delete
	$(MAKE) -C ${MKDOC} clean
	$(MAKE) -C ${THEMES} clean

style:
	$(MAKE) -C ${MKDOC} style

test:
	$(MAKE) -C ${MKDOC} test

server:
	cd $(TARGET) && python -m SimpleHTTPServer 8181

update:
	git pull -u origin master
	git submodule foreach "git checkout master; git pull -u origin master"

publish: build
	cd $(TARGET) && git add -A . && git commit -m "published `date --iso=minutes`" && git push origin master -f

publish-uni: build
	rsync -av --progress --delete -e ssh \
	  www/ \
	  schilly@login.mat.univie.ac.at:/users/schilly/public_html/collscientiae/
