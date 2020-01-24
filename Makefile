USER_NAME=demshin

build_comment:
	export USER_NAME=${USER_NAME} && cd src/comment && bash docker_build.sh
build_post:
	export USER_NAME=${USER_NAME} && cd src/post-py && bash docker_build.sh
build_ui:
	export USER_NAME=${USER_NAME} && cd src/ui && bash docker_build.sh
build_prometheus:
	export USER_NAME=${USER_NAME} && cd monitoring/prometheus && docker build -t $USER_NAME/prometheus .
build_cloudprober:
	export USER_NAME=${USER_NAME} && cd monitoring/cloudprober && docker build -t $USER_NAME/cloudprober .

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
