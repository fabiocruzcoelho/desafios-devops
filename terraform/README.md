# Desafio 01: Infrastructure-as-code - Terraform

## Motivação

Recursos de infraestrutura em nubvem devem sempre ser criados utilizando gerenciadores de configuração, tais como Cloudformation, Terraform ou Ansible, garantindo que todo recurso possa ser versionado e recriado de forma facilitada.

Este repo faz o deploy de uma instância amazon Linux com container httpd rondando na porta 80, utilizando o `terraform` e suas melhores praticas dentro da cloud da aws.

## Requerido

Para executar o mesmo, é preciso ter alguns pacotes instalados e configurados na maquina local.

- Credentials aws
- Terraform
- Make

- Exportar as credentials aws, ou instalar o binario `awscli` devidamente configurado com suas  `access key` e `secret key`

```bash
- export AWS_ACCESS_KEY_ID='xxxxxxx'
- export AWS_SECRET_ACCESS_KEY='xxxxxxxxxxx'
```

## Uso

Clonar o projeto no seu diretorio de preferencia, acessar o diretorio `terraform`

```bash
git clone https://github.com/fabiocruzcoelho/desafios-devops.git
```

- `Terraform cli`

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

- `Make`

```bash
make deploy
```

### Exemplo Inputs

- Qual range de IP deseja liberar para acesso SSH? 
  - `200.200.200.200/32`

- Qual regiao deseja utilizar?
  - `us-west-2`

Observe que este exemplo pode criar recursos que custam dinheiro. Execute `terraform destroy -auto-approve` ou `make destroy` quando você não precisar desses recursos.
