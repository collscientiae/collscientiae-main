# CollScientiaie Root Project


Getting Started
---------------

Make sure to not only clone from here or your fork,
 but also to initialize all
 [submodules](http://git-scm.com/book/en/Git-Tools-Submodules).

     git clone --recursive git@github.com:sagemath/website.git

 or if you forgot the `--recursive` switch, do this:

     git submodule update --init --recursive

 Later, don't forget to not only update the `website` project,
 but also the submodules
 (or whatever it is the right thing to do).
 For example:

     git submodule foreach "git checkout master; git pull origin master"


### Credits

Correct Latin spelling by Martin Piskernig and David Langer.


