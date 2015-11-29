# dh-quicklisp-buildapp

This dh utility lets you compile your quicklisp-based Common Lisp code
into a buildapp binary in a .deb with almost no effort.

For the "almost no effort" part to work, `dh-quicklisp-buildapp` is
quite opinionated.

## Installation

```
$ wget https://github.com/ralt/dh-quicklisp-buildapp/releases/download/0.2/dh-quicklisp-buildapp_0.2_all.deb # Validate it with the .dsc
$ sudo dpkg -i dh-quicklisp-buildapp_0.2_all.deb
$ sudo apt-get -f install # Install missing dependencies if necessary
```

## Instructions

Setup your `debian/` folder with at minimum:

- A `control` file
- A `changelog` file
- A `compat` file
- A `rules` file

The `control` file should have your source and package information.
The `changelog` should have the changelog of your application. See
`dch` for more information.
The `compat` file should have just the `9` number in it.

The `rules` file just needs this:

```
#!/usr/bin/make -f

%:
        dh $@ --with=quicklisp_buildapp
```

(Note that a tab character is needed.)

When you run `dpkg-buildpackage` in your source's root folder, for
each package defined in the `control` file, it will get the system
named `$package`, and use the `main` function of it as the entrypoint.

It will fetch the latest quicklisp and then use `buildapp` to generate
the binary that will be put in the .deb file.

## Roadmap

Eventually, `dh-quicklisp-buildapp` will support customizations such as:

- Specify the dist-url of quicklisp
- For each package, specify where the system's asd is
- For each package, specify the entrypoint
- For each package, specify the system's name

Patches welcome!

## License

MIT license.

## About me

My keybase: https://keybase.io/fmargaine
