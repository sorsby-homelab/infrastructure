.PHONY: install run test

install:
	ansible-galaxy collection install community.general community.proxmox

run:
	ansible-playbook playbooks/setup.yml --ask-vault-pass

test:
	ansible-playbook playbooks/setup.yml --tags "test"