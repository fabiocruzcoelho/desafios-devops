# Desafio 02: Kubernetes

## Motivação

Kubernetes atualmente é a principal ferramenta de orquestração e _deployment_ de _containers_ utilizado no mundo, práticamente tornando-se um padrão para abstração de recursos de infraestrutura.

## Requerido

Para executar este projeto é preciso ter alguns binarios instalado na maquina local.

- helm (3.2x) [info](https://github.com/helm/helm/releases/tag/v3.2.0)
- Minikube
- Kubectl
- Docker
- Make

## Uso unico comando

- make deploy

## Uso comando por comando

- make docker.build
- make make helm.deploy
- make test
- make helm.delete

## Destroy

- minikube delete

```bash
kubectl get po,deploy,svc,ep,ing -n desafio-idwall        
NAME                            READY   STATUS    RESTARTS   AGE
pod/node-app-7bb5fc7d6b-qkfbs   1/1     Running   0          5m49s
pod/node-app-7bb5fc7d6b-rfsbf   1/1     Running   0          5m49s

NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/node-app   2/2     2            2           5m49s

NAME                           TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
service/node-app-auto-deploy   NodePort   10.104.138.22   <none>        80:32159/TCP   5m49s

NAME                             ENDPOINTS                         AGE
endpoints/node-app-auto-deploy   172.18.0.5:3000,172.18.0.6:3000   5m49s

NAME                                      CLASS    HOSTS              ADDRESS      PORTS   AGE
ingress.extensions/node-app-auto-deploy   <none>   hello-node.local   172.17.0.2   80      5m49s
```

## Url de acesso

- http://hello-node.local/