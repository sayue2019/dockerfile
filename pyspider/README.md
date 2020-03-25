Dockerfile
========

I use these dockerfiles myself in k8s. **[TRY IT NOW!]**

- Mysql-client run SQL using Shell.
- Pyspider under python3.6, made with alpine, only 500m.


Installation
------------

* `git clone git@github.com:binux/pyspider.git`
* `cd pyspider`
* `cp -f ~/dockerfile/pyspider/dockerfile dockerfile`
* `docker build --no-cache -t imageName:tagName .`

**WARNING:** If you are in China, please use the dockerfile under the cn folder.

License
-------
Licensed under the Apache License, Version 2.0
