# demshin_microservices

demshin microservices repository
[![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/demshin_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2019-08/demshin_microservices)

## Homework-15. Monitoring-1. Prometheus

1. Run Prometheus on docker.
2. Configure Prometheus.
3. Run microservices with Prometheus.
4. Add aliases for hosts at `docker-compose.yml`.
5. Experimenting with stop/start services.
6. Get metrics from host. Add node-exporter.
7. Push docker images to Docker Hub.
8. Task with *. Add [percona/mongodb_exporter](https://github.com/percona/mongodb_exporter), [docker image](https://hub.docker.com/r/forekshub/percona-mongodb-exporter/).
9. Task with *. Add cloudprober.
10. Task with *. Add `Makefile` with build & push commands.

## Homework-14. Gitlab CI

1. Create an instance for Gitlab CI with terraform (also with remote exec provisioner).
2. Install Gitlab CI (omnibus).
3. Setup Gitlab CI (create group, project).
4. Setup Gitlab Runner
5. Reconfigure `.gitlab-ci.yml`
   1. Add reddit application.
   2. Add unit tests for reddit application.
   3. Add environments.
      1. Dev (autodeploy)
      2. Production & staging (manual deploy with git semver tags).
      3. Dynamic
6. Task with *. Build app. See `.gitlab-ci.yml`.
7. Task with *. Multiple Gitlab Runners.
   1. Simple way. Run `.gitlab-ci/scripts/gitlab_runner.sh` on server.
   2. Better way. Use [ansible role](https://github.com/riemers/ansible-gitlab-runner).
8. Task with *. Slack integration [`#aleksandr_demshin`](https://devops-team-otus.slack.com/archives/CBA32AEH5).

## Homework-13. Docker-4. Docker-compose

1. Work with docker networks.
   1. None network driver.
   2. Host network driver.
   3. Bridge network driver.
2. Docker-compose
   1. Use few networks at `docker-compose.yml`.
   2. Set env variables at `.env` file. See at the `.env.example`.
   3. By default, docker compose bases the project name on basename of the directory compose commands are run from. The project name can be overridden either by passing a `-p` / `--project-name` option for each command or setting the `COMPOSE_PROJECT_NAME` environment variable. For example: `docker-compose -p demshin_otus_project`.
   4. Task with *. See `docker-compose.override.yml`.

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
