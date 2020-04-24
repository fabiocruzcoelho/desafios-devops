# include $(shell bash)

APP_NAME :=node-app
NAMESPACE :=desafio-idwall
IMAGE_NAME :=idwall-app-image

.PHONY: minikube.init docker.build helm.deploy helm.delete test deploy

minikube.init:
	minikube start
	minikube addons enable ingress
	sudo bash -c 'echo "$$(minikube ip) hello-node.local" >> /etc/hosts'
	kubectl create namespace $(NAMESPACE)
	
docker.build:
	eval $$(minikube docker-env);\
	docker build -t $(IMAGE_NAME) .

helm.deploy:
	@helm install  \
			--set image.repository="$(IMAGE_NAME)" \
			--set image.tag="latest" \
			--set image.pullPolicy=Never \
			--set application.track="stable" \
			--set releaseOverride="$(APP_NAME)" \
			--set serviceweb.enabled="true" \
			--set service.internalPort="3000" \
			--set service.externalPort="80" \
			--set service.type="NodePort" \
			--set service.probe.healthcheck="/" \
			--set replicaCount="2" \
			--set application.application_name="$(APP_NAME)" \
			--set show.name="Fabio Coelho" \
			--set livenessprobe.initialDelaySeconds="15" \
			--set readinessprobe.initialDelaySeconds="15" \
			--set resources.requests.memory="100Mi" \
			--set resources.requests.cpu="100m" \
			--set resources.limits.memory="500Mi" \
			--set resources.limits.cpu="1000m" \
			--namespace="$(NAMESPACE)" \
			--version="1" \
			"$(APP_NAME)" \
			deploy/
	kubectl rollout status -n $(NAMESPACE) -w "deployment/$(APP_NAME)"

helm.delete:
	helm delete --purge production-node

test:
	@curl hello-node.local


deploy: minikube.init docker.build helm.deploy test