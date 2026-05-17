# Como fazer deploy

## 1. Construa e teste localmente

```bash
docker build -t sre-app:1.0.1 app/
docker run -p 8001:8001 sre-app:1.0.1
```

## 2. Execute os testes

```bash
cd tests && pytest -v
```

## 3. Execute o deploy

```bash
./deploy.sh 1.0.1
```

## 4. Monitore a aplicação

```bash
./monitor.sh
```

---

# Como fazer rollback

Se algo der errado após o deploy:

## 1. Execute o rollback

```bash
./rollback.sh
```

## 2. Verifique se a versão anterior voltou

```bash
curl http://localhost:8001/health
```

## 3. Investigue o problema antes de tentar novo deploy

---

# Checklist de Deploy

- [ ] Testes passando localmente
- [ ] Pipeline do GitHub passou
- [ ] Versão anterior está taggeada
- [ ] Notificou a equipe
- [ ] Monitore por 15 minutos após deploy

---

# Teste o processo completo

## Torne os scripts executáveis

```bash
chmod +x deploy.sh rollback.sh
```

## Faça um deploy

```bash
./deploy.sh 1.0.0
```

## Verifique se está funcionando

```bash
./monitor.sh
```

## Simule um rollback

```bash
./rollback.sh
```

## Verifique se voltou

```bash
./monitor.sh
```