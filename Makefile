DEFAULT_GOAL := help 

lint: ## Run chart-tester lint
	@docker run -it --rm --workdir=/data --volume ~/.kube/config:/root/.kube/config:ro --volume $(shell pwd):/data quay.io/helmpack/chart-testing:v3.10.1 ct lint --target-branch chart-pipeline --all --chart-repos bitnami=https://charts.bitnami.com/bitnami,prometheus-charts=https://prometheus-community.github.io/helm-charts,grafana=https://grafana.github.io/helm-charts,ethereum-helm-charts=https://ethpandaops.github.io/ethereum-helm-charts

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'