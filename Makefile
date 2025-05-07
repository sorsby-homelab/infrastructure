.PHONY: install run test

setup:
	python3.11 -m pip install --user ansible proxmoxer requests ansible-lint kubernetes

install:
	ansible-galaxy collection install community.general devsec.hardening hifis.toolkit kubernetes.core && ansible-galaxy role install geerlingguy.haproxy geerlingguy.containerd rolehippie.coredns

run:
	ansible-playbook playbooks/main.yml --ask-vault-pass -v

infra:
	ansible-playbook playbooks/01-infrastructure.yml --ask-vault-pass -v

keepalived:
	ansible-playbook playbooks/02-keepalived.yml --ask-vault-pass -v

k8s:
	ansible-playbook playbooks/03-init-k8s.yml --ask-vault-pass -v

argocd:
	ansible-playbook playbooks/04-argocd.yml --ask-vault-pass -v

coredns:
	ansible-playbook playbooks/05-coredns.yml --ask-vault-pass -v

dry_run:
	ansible-playbook playbooks/infrastructure.yml --ask-vault-pass -v --check

test:
	ansible-playbook playbooks/setup.yml --tags "test"