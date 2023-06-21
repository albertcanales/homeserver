HOMESERVER_TAGS = docs homer vpn nginx arr
TORRESERVER_TAGS =

all: $(HOMESERVER_TAGS) $(TORRESERVER_TAGS)

list:
	@echo $(HOMESERVER_TAGS) $(TORRESERVER_TAGS)

create_secret:
	./create_secret.sh

encrypt_secret:
	for secret in roles/*/vars/main/secret.yml ; do \
	    echo -n "Encrypting $$secret -> " ; \
	    ansible-vault encrypt $$secret ; \
	done

decrypt_secret:
	for secret in roles/*/vars/main/secret.yml ; do \
	    echo -n "Decrypting $$secret -> " ; \
	    ansible-vault decrypt $$secret ; \
	done

$(HOMESERVER_TAGS):
	ansible-playbook main.yml -t $@ --limit 'homeserver'

$(TORRESERVER_TAGS):
	ansible-playbook main.yml -t $@ --limit 'torreserver'
