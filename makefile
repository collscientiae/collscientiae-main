# absolute paths, necessary because we call it in a subdir
MKDOC = collscientia
THEMES = themes
SOURCE=doc
TARGET=www

.PHONY = render clean style test update

render: clean
	mkdir ${TARGET}
	make -C ${THEMES}
	cd ${MKDOC} && \
    python -m ${MKDOC}.${MKDOC} \
    ../${SOURCE} ../${THEMES}/sage ../${TARGET}

clean:
	$(RM) -r ${TARGET}

style:
	$(MAKE) -C ${MKDOC} style

test:
	$(MAKE) -C ${MKDOC} test

update:
	git pull -u origin master
	git submodule foreach "git checkout master; git pull -u origin master"
