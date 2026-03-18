.PHONY: add-repo
add-repo:
	@helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
	@helm repo add postgres https://raw.githubusercontent.com/hansehe/postgres-helm/master/helm/charts/postgres

.PHONY: cluster
cluster:
	@kind create cluster

.PHONY: dev
dev: add-repo cluster
	cd db_charts && helm depdendency build
	helm install db_charts db_charts

