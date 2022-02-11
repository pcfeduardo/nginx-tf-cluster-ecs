# nginx-tf-cluster-ecs

## Estrutura do Projeto
### NGINX
- Configurado dentro de um Dockerfile, com opções para exibição de logs de acessos e erros em stdout

### Terraform
- Terraform configurado com módulos, load balancer e configuração de CNAME em hosted zone

## How to
- Baixe o projeto
- Configure as variáveis de ambiente
- Crie um repositório ECR na AWS
- Faça o push da imagem
- Configure as variáveis do módulo do terraform
- Configure o backend do terraform e também o profile
- Execute o deploy via tf =)