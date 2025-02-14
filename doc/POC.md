# Інструкція Доступу до Інтерфейсу ArgoCD

Ця документація надає кроки для отримання доступу до інтерфейсу користувача ArgoCD.

## Вступ

ArgoCD - це декларативне, GitOps-інструмент розгортання, що дозволяє легко управляти конфігураціями Kubernetes.

## Попередні Вимоги

Перед початком переконайтеся, що у вас є:
- Доступ до Kubernetes кластера
- Встановлений та налаштований kubectl
- Встановлений ArgoCD на вашому кластері

## Крок 1: Встановлення ArgoCD

Якщо ArgoCD ще не встановлено у вашому кластері, ви можете встановити його за допомогою наступної команди:

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Крок 2: Налаштування Доступу до Інтерфейсу
## Порт-форвардинг
Для доступу до інтерфейсу користувача ArgoCD локально, використовуйте порт-форвардинг:

``` bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```
Тепер інтерфейс ArgoCD доступний за адресою http://localhost:8080.


## Крок 3: Аутентифікація
Початкові дані для входу:

**Ім'я користувача:** admin
**Пароль:** використовуйте команду нижче для отримання пароля

``` bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

## Крок 4: Доступ до Інтерфейсу
Після аутентифікації ви зможете доступитися до інтерфейсу користувача ArgoCD і почати управління вашими додатками та конфігураціями.
