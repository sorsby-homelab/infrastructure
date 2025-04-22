.PHONY: install run test

setup:
	python3.11 -m pip install --user ansible proxmoxer requests ansible-lint

install:
	ansible-galaxy collection install community.general devsec.hardening hifis.toolkit && ansible-galaxy role install geerlingguy.haproxy

run:
	ansible-playbook playbooks/infrastructure.yml --ask-vault-pass -v

dry_run:
	ansible-playbook playbooks/infrastructure.yml --ask-vault-pass -v --check

test:
	ansible-playbook playbooks/setup.yml --tags "test"