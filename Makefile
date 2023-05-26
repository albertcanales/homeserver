TAGS = docs homer scrutiny nginx

all: $(TAGS)

list:
	@echo $(TAGS)

$(TAGS):
	ansible-playbook main.yml -t $@
