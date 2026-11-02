export KUBECONFIG := $(CURDIR)/ansible/kubeconfig

.PHONY: up down

up:
	cd terraform && tofu apply -auto-approve
	cd ansible && ansible-playbook site.yml

down:
	cd terraform && tofu destroy