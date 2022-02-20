CONFIG         ?= .
BACKEND_CONFIG := $(wildcard $(CONFIG)/backend.tfvars)
BACKEND_ARGS   := $(foreach config,$(BACKEND_CONFIG),-backend-config=$(config))
STATE          := $(CONFIG)/terraform.tfstate
TFVARS         := $(wildcard $(CONFIG)/tfvars.json)
TFVARS_ARGS    := $(foreach varfile,$(TFVARS),-var-file=$(varfile))

export TF_DATA_DIR         := $(CONFIG)/.terraform
export TF_CLI_ARGS_init    := $(BACKEND_ARGS)
export TF_CLI_ARGS_import  := $(TFVARS_ARGS) -input=false -state=$(STATE)
export TF_CLI_ARGS_plan    := $(TFVARS_ARGS) -input=false -state=$(STATE)
export TF_CLI_ARGS_apply   := $(TF_CLI_ARGS_plan)
export TF_CLI_ARGS_destroy := $(TF_CLI_ARGS_plan)

.PHONY: default
default: $(CONFIG)/.applied

.PHONY: fmt
fmt:
	terraform fmt

.PHONY: plan
plan: clean_plan $(CONFIG)/.plan

.PHONY: validate
validate:
	export TF_CLI_ARGS_init=-backend=false
	terraform validate

.PHONY: destroy
destroy:
	terraform destroy
	$(MAKE) clean

.PHONY: reconfigure
reconfigure:
	terraform init -reconfigure
	touch $(CONFIG)/.initialized

.PHONY: migratestate
migratestate:
	terraform init -migrate-state
	touch $(CONFIG)/.initialized

.PHONY: clean
clean:
	rm -rf $(CONFIG)/.terraform $(CONFIG)/.initialized $(CONFIG)/.applied

.PHONY: apply
apply: clean_apply $(CONFIG)/.applied

.PHONY: apply-saved
apply-saved: $(CONFIG)/.initialized
	@if [ ! -f "$(CONFIG)/.plan" ]; then \
		echo "No plan has been saved." 1>&2; \
		fi
	TF_CLI_ARGS_apply= terraform apply -state=$(STATE) "$(CONFIG)/.plan"
	rm -f $(CONFIG)/.plan
	touch $(CONFIG)/.applied

.PHONY: shell
shell:
	"$${SHELL:-sh}"

.PHONY: init
init: clean_init $(CONFIG)/.initialized

.PHONY: upgrade
upgrade:
	terraform init -upgrade=true
	touch $(CONFIG)/.initialized

.PHONY: clean_apply
clean_apply:
	rm -f $(CONFIG)/.applied

.PHONY: clean_init
clean_init:
	rm -f $(CONFIG)/.initialized

.PHONY: clean_plan
clean_plan:
	rm -f $(CONFIG)/.plan

$(CONFIG)/.applied: $(CONFIG)/.initialized $(TFVARS) *.tf
	terraform apply
	rm -f $(CONFIG)/.plan
	touch $(CONFIG)/.applied

$(CONFIG)/.plan: $(CONFIG)/.initialized $(TFVARS) *.tf
	terraform plan -out $(CONFIG)/.plan

$(CONFIG)/.initialized: $(BACKEND_CONFIG) $(CONFIG)/.dependencies
	terraform init
	touch $(CONFIG)/.initialized

$(CONFIG)/.dependencies: *.tf
	@if [ ! -d "$(CONFIG)" ]; then \
		echo "No such config: $(CONFIG)" 1>&2; \
		echo "Specify another config by passing CONFIG=name" 1>&2; \
		fi
	@grep -ohE \
		"\b(backend|provider|resource|module) ['\"][[:alpha:]][[:alnum:]]*|\bsource  *=.*|\bversion *=.*" *.tf | \
		sed "s/['\"]//" | sort | uniq | \
		tee /tmp/initdeps | \
		diff -q .dependencies - >/dev/null 2>&1 || \
		mv /tmp/initdeps .dependencies
