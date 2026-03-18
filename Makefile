.PHONY: add-repo
add-repo:
	@helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
	@helm repo add prometheus https://prometheus-community.github.io/helm-charts

.PHONY: clean
clean:
	@kind delete cluster
	@rm -rf db_charts/chartsk9s

.PHONY: cluster
cluster: clean
	@kind create cluster

.PHONY: dev
dev: add-repo cluster
	cd db_charts && helm dependency build
	helm install obs db_charts

