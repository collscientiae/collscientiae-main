NEWDOC=newdoc
# absolute paths, necessary because we call it in a subdir
SOURCE=doc
TARGET=www

.PHONY = render clean style test

render: clean
	mkdir ${TARGET}
	cd ${NEWDOC} && python -m sage.newdoc.newdoc ../${SOURCE} ../${TARGET}

clean:
	$(RM) -r ${TARGET}
	$(MAKE) -C ${NEWDOC} clean

style:
	$(MAKE) -C ${NEWDOC} style

test:
	$(MAKE) -C ${NEWDOC} test