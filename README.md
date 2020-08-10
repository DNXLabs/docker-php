# docker-php

Docker image containing php:7.4-apache and the following php extensions:
- mcrypt
- pdo
- pdo_mysql 
- mysqli
- mbstring
- zip
- xml
- gettext
- exif
- gd

### Build Locally

If you want to build and use your own local image

```bash
# build image locally
$ make build
# go inside the container
$ make shell
```

## Update Docker image

1. Change (or not) `VERSION` in `Makefile`
2. Build and test locally
3. Commit and push the changes
4. Tag the commit with the command `make gitTag`
5. Go to [hub.docker.com](hub.docker.com)
6. In `Build Details` tab, you should now see the new tag kicking off

Docker image
------------

The Docker image has the following:

- php:7.4-apache
