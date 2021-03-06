# demshin_microservices

demshin microservices repository
[![Build Status](https://travis-ci.com/Otus-DevOps-2019-08/demshin_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2019-08/demshin_microservices)

## Homework-20. Kubernetes-3

1. Experiments with kube-dns.
2. Balancing with Service LoadBalancing.
3. Balancing with Ingress.
4. Setup https with Secret. Task with *. See at `kuberetes/reddit/ui-secret.yml`.
5. Setup Network Policy for mongodb. See at `kubernetes/reddit/mongo-network-policy.yml`.
6. Work mongo volumes.
   1. Persistence volumes.
   2. Dynamic Persistence volumes.

## Homework-19. Kubernetes-2

1. Install kubectl, minikube.
2. Start cluster with minikube.
3. Create Deployments for ui, comment, post, mongodb.
4. Create Services for ui, comment, post, mongodb.
5. Use Dashboard for minikube.
6. Create Namespace dev.
7. Create GKE cluster. Add screenshot.
8. Task with *. Create simple GKE cluster with terraform. See at `kubernetes/terraform`.

## Homework-18. Kubernetes-1

1. Kubernetes The Hard Way
2. Task with *. No. :(

## Homework-17. Logging-1. Logging & tracing

1. Update reddit app & build new docker images with `logging` tag.
2. Fluentd init setup.
3. Filters for fluentd.
4. Task with *. Additional grok for fluentd.
5. Add zipkin.

## Homework-16. Monitoring-2. Monitoring of infrastructure & application

1. Separate `docker-compose.yml` on two files (application & monitoring).
2. Add [cadvisor](https://github.com/google/cadvisor).
3. Add Grafana.
   1. Import dashboards.
   2. Create my own dashboards.
   3. Alerting.
4. [My Docker Hub](https://hub.docker.com/u/demshin).

### Tasks with *

1. Add commands for build & push to Makefile.
2. Docker experimental mode (data for prometheus).
   1. Setup docker daemon on host.

```json
      {
            "metrics-addr" : "0.0.0.0:9323",
            "experimental" : true
      }
```

   2. Setup Prometheus. See at `prometheus.yml`.
   3. Add [dashboard](https://grafana.com/grafana/dashboards/1229) to grafana. See at `./monitoring/grafana/dashboards/Engine_Daemon_Monitoring.json`.
3. Add Telegraf & InfluxDB, also add [dashboard](https://grafana.com/grafana/dashboards/10585) `Docker_Telegraf_Monitoring.json`.
4. Add HTTP requests slowing down, 95th percentile is over 0.15s for 5 minutes. See at `alerts.yml`. I decided not to do the alerts on e-mail, because email alerting is not good practice in 2019.

## Tasks with **

1. Provisioning of Grafana (datasources & dashboards).

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
