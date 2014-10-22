# CollScientiaie Root Project

This consists of three parts:

* the [collscientiae code](https://github.com/collscientiae/collscientiae)
* [the one or more themes from here](https://github.com/collscientiae/themes)
* some [documentation modules](https://github.com/collscientiae/documentation)

## Getting Started

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


## License

* Code: [Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0)
* Documentation: Should have separate licensing information attached, per module.
Otherwise [CC Attribution-ShareAlike 4.0 International](http://creativecommons.org/licenses/by-sa/4.0/)

## Credits

Correct Latin spelling by Martin Piskernig and David Langer.


