# demshin_microservices

demshin microservices repository
[![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/demshin_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2019-08/demshin_microservices)

[TOC]

## Homework-12. Docker-3

1. Add `Dockerfile`s
2. Add linter for `Dockerfile`s & use it.
3. Build & run app.
4. Build & run app with new network aliases (using `--env'). Task with *.

```bash
docker network create reddit
docker run -d --network=reddit --network-alias=postdb --network-alias=commentdb mongo:latest
docker run -d --network=reddit --env POST_DATABASE_HOST=postdb --network-alias=postapp demshin/post:1.0
docker run -d --network=reddit --env COMMENT_DATABASE_HOST=commentdb --network-alias=commentapp demshin/comment:1.0
docker run -d --network=reddit --env COMMENT_SERVICE_HOST=commentapp --env POST_SERVICE_HOST=postapp -p 9292:9292 demshin/ui:1.0
```

5. Optimize images. Based on Alpine (task with *).
6. Add volume to mongo.

## Homework-11. Docker-2

1. Travis integration.
2. See `docker-1.log` file. (also * task)
3. `docker run --rm -ti tehbilly/htop` will show only one process - `htop`. `docker run --rm --pid host -ti tehbilly/htop` will show all processes on the host running the container.
4. Setup Google cloud integration with docker-machine.
5. Create Dockerfile and config files.
6. Docker Hub registration.
7. Work with Docker on GCP.
