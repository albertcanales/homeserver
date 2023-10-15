HOMESERVER_TAGS = homer docs caddy admin media arr app
TORRESERVER_TAGS =

all:
	ansible-playbook main.yml

homeserver:
	ansible-playbook homeserver.yml

torreserver:
	ansible-playbook torreserver.yml

list:
	@echo all homeserver torreserver $(HOMESERVER_TAGS) $(TORRESERVER_TAGS)

create_secret:
	./create_secret.sh

encrypt_secret:
	for secret in group_vars/*/secret.yml ; do \
	    echo -n "Encrypting $$secret -> " ; \
	    ansible-vault encrypt $$secret ; \
	done
	for secret in roles/*/vars/main/secret.yml ; do \
	    echo -n "Encrypting $$secret -> " ; \
	    ansible-vault encrypt $$secret ; \
	done

decrypt_secret:
	for secret in group_vars/*/secret.yml ; do \
	    echo -n "Decrypting $$secret -> " ; \
	    ansible-vault decrypt $$secret ; \
	done
	for secret in roles/*/vars/main/secret.yml ; do \
	    echo -n "Decrypting $$secret -> " ; \
	    ansible-vault decrypt $$secret ; \
	done

$(HOMESERVER_TAGS):
	ansible-playbook main.yml -t $@ --limit 'homeserver'

$(TORRESERVER_TAGS):
	ansible-playbook main.yml -t $@ --limit 'torreserver'

backup:
	ansible-playbook backup.yml
