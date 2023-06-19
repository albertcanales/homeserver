HOMESERVER_TAGS = docs homer vpn nginx arr
TORRESERVER_TAGS =

all: $(HOMESERVER_TAGS) $(TORRESERVER_TAGS)

list:
	@echo $(HOMESERVER_TAGS) $(TORRESERVER_TAGS)

$(HOMESERVER_TAGS):
	ansible-playbook main.yml -t $@ --limit 'homeserver'

$(TORRESERVER_TAGS):
	ansible-playbook main.yml -t $@ --limit 'torreserver'
