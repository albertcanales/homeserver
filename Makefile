TAGS = docs homer wireguard scrutiny nginx arr

all: $(TAGS)

list:
	@echo $(TAGS)

$(TAGS):
	ansible-playbook main.yml -t $@
