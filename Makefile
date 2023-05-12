TAGS = docs homer scrutiny

all: $(TAGS)

list:
	@echo $(TAGS)

$(TAGS):
	ansible-playbook main.yml -t $@
