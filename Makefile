.PHONY: install run test

install:
	ansible-galaxy collection install community.general devsec.hardening

run:
	ansible-playbook playbooks/infrastructure.yml # --ask-vault-pass

test:
	ansible-playbook playbooks/setup.yml --tags "test"