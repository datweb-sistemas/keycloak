# Keycloak ECS Deployment

Keycloak rodando em AWS ECS Fargate com ALB e RDS PostgreSQL.

## 🚀 Deployment Automático

Cada push na branch `main` dispara automaticamente:
1. Build da imagem Docker
2. Push para GitHub Container Registry
3. Registro de nova task definition no ECS
4. Deploy no ECS com 1 instância

## 🔗 URLs

- **Admin Console**: https://oauth.datweb.com.br/admin
- **API**: https://oauth.datweb.com.br

## 📋 Infraestrutura

- **Cluster**: ecs-cluster
- **Service**: keycloak-service
- **ALB**: keycloak-alb
- **Database**: keycloak-db (RDS PostgreSQL 18.1)
- **Region**: us-east-1

## 🔧 Configuração

As credenciais estão no AWS Secrets Manager:
- `keycloak/admin-username`
- `keycloak/admin-password`
- `keycloak/db-*`

## 🛠️ Deploy Manual
```bash
# Registrar task definition
aws ecs register-task-definition --cli-input-json file://task-definition.json

# Forçar deploy
aws ecs update-service \
  --cluster ecs-cluster \
  --service keycloak-service \
  --task-definition keycloak-task \
  --desired-count 1 \
  --force-new-deployment
```

## 📊 Monitoramento
```bash
# Ver logs
aws logs tail /ecs/keycloak --follow

# Ver status do service
aws ecs describe-services \
  --cluster ecs-cluster \
  --services keycloak-service
```