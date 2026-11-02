export KUBECONFIG := $(CURDIR)/ansible/kubeconfig

.PHONY: up down check-token

check-token:
ifndef GITHUB_TOKEN
	$(error Variable GITHUB_TOKEN is not set. Execution aborted)
endif

up: check-token
	cd terraform && tofu apply -auto-approve
	cd ansible && ansible-playbook site.yml

down:
	cd terraform && tofu destroy
