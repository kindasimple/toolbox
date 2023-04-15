toolbox
=======

Docker image that packages common build tools for python


## Quickstart
```
build the image
docker build -t toolbox .

# lint dockerfile
$ docker run --rm -v `pwd`:/src toolbox hadolint Dockerfile

Dockerfile:8 DL3008 warning: Pin versions in apt get install. Instead of `apt-get install <package>` use `apt-get install <package>=<version>`
Dockerfile:14 DL3013 warning: Pin versions in pip. Instead of `pip install <package>` use `pip install <package>==<version>` or `pip install --requirement <requirements file>

# run flake8 to lint python
$ echo "import pdb; pdb.set_trace()" > main.py
$ docker run --rm -v `pwd`:/src toolbox flake8 main.py

main.py:1:11: E702 multiple statements on one line (semicolon)
```