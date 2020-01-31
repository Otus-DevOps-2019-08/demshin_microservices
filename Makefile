USER_NAME=demshin

build_comment:
	export USER_NAME=${USER_NAME} && cd src/comment && bash docker_build.sh
build_post:
	export USER_NAME=${USER_NAME} && cd src/post-py && bash docker_build.sh
build_ui:
	export USER_NAME=${USER_NAME} && cd src/ui && bash docker_build.sh
build_prometheus:
	export USER_NAME=${USER_NAME} && cd monitoring/prometheus && docker build -t ${USER_NAME}/prometheus .
build_cloudprober:
	export USER_NAME=${USER_NAME} && cd monitoring/cloudprober && docker build -t ${USER_NAME}/cloudprober .
build_alertmanager:
	export USER_NAME=${USER_NAME} && cd monitoring/alertmanager && docker build -t ${USER_NAME}/alertmanager .
build_grafana:
	export USER_NAME=${USER_NAME} && cd monitoring/grafana && docker build -t ${USER_NAME}/grafana .
build_telegraf:
	export USER_NAME=${USER_NAME} && cd monitoring/telegraf && docker build -t ${USER_NAME}/telegraf .
build_fluentd:
	export USER_NAME=${USER_NAME} && cd logging/fluentd && docker build -t ${USER_NAME}/fluentd .

push_comment:
	docker push ${USER_NAME}/comment
push_post:
	docker push ${USER_NAME}/post
push_ui:
	docker push ${USER_NAME}/ui
push_prometheus:
	docker push ${USER_NAME}/prometheus
push_cloudprober:
	docker push ${USER_NAME}/cloudprober
push_alertmanager:
	docker push ${USER_NAME}/alertmanager
push_grafana:
	docker push ${USER_NAME}/grafana
push_telegraf:
	docker push ${USER_NAME}/telegraf
push_fluentd:
	docker push ${USER_NAME}/fluentd

run_app:
	cd docker && docker-compose -f docker-compose.yml up -d
run_monitoring:
	cd docker && docker-compose -f docker-compose-monitoring.yml up -d
