SHELL:=/bin/bash

.PHONY: deploy output destroy

deploy:
	@echo "Deploy Instance"
	@terraform init
	@terraform plan 
	@terraform apply -auto-approve


output:
	@echo "Get public_ip"
	@terraform output public_ip

destroy:
	@echo "Destroy Instance"
	@terraform destroy -auto-approve
