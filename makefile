# absolute paths, necessary because we call it in a subdir
MKDOC = collscientia
THEMES = themes
SOURCE=doc
TARGET=www

.PHONY = render clean style test update

render:
	make -C ${THEMES}
	cd ${MKDOC} && \
    python -m ${MKDOC}.${MKDOC} \
    ../${SOURCE} ../${THEMES}/sage ../${TARGET}

clean:
	$(RM) -r ${TARGET}
	$(MAKE) -C ${MKDOC} clean
	$(MAKE) -C ${THEMES} clean

style:
	$(MAKE) -C ${MKDOC} style

test:
	$(MAKE) -C ${MKDOC} test

server:
	cd www && python -m SimpleHTTPServer 8181

update:
	git pull -u origin master
	git submodule foreach "git checkout master; git pull -u origin master"
