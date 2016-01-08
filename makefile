# written for python 3
PYTHON ?= python3

# absolute paths, necessary because we call it in a subdir
MKDOC   = collscientiae
THEMES  = themes
SOURCE  = doc
TARGET  = www

.PHONY  = build clean style test update

build:
	make -C ${THEMES}
	cd ${MKDOC} && ${PYTHON} -m ${MKDOC}.${MKDOC} ../${SOURCE} ../${THEMES}/sage ../${TARGET}

clean:
	$(RM) -r $(TARGET)
	$(MAKE) -C ${MKDOC} clean
	$(MAKE) -C ${THEMES} clean

style:
	$(MAKE) -C ${MKDOC} style

test:
	$(MAKE) -C ${MKDOC} test

server:
	cd $(TARGET) && python -m SimpleHTTPServer 8181

update:
	git pull --ff-only -u origin master
	git submodule foreach "git checkout master; git pull --ff-only -u origin master"

publish: build
	cd $(TARGET) && \
		git init && \
		git remote add origin git@github.com:collscientiae/collscientiae.github.io.git && \
		git add -A . && \
		git commit -m "published `date --iso=minutes`" && \
		git push origin master -f

