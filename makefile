# absolute paths, necessary because we call it in a subdir
MKDOC = collscientia
SOURCE=doc
TARGET=www

.PHONY = render clean style test

render: clean
	mkdir ${TARGET}
	cd ${MKDOC} && python -m ${MKDOC}.${MKDOC} ../${SOURCE} ../${TARGET}

clean:
	$(RM) -r ${TARGET}
	$(MAKE) -C ${MKDOC} clean

style:
	$(MAKE) -C ${MKDOC} style

test:
	$(MAKE) -C ${MKDOC} test
