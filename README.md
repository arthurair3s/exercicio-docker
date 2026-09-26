# Exercício Docker

Imagem Docker de uma aplicação Node.js, criada para praticar `ARG`, `ENV`, `VOLUME`, `ENTRYPOINT` + `CMD` e `entrypoint.sh` com `exec`.

## O que a aplicação faz

Sobe um servidor HTTP na porta 3000 que responde:

```
Olá <nome>
Modo: <modo>
```

- `<nome>` vem do argumento passado no `docker run` (padrão: `visitante`).
- `<modo>` vem da variável de ambiente `MODO`, definida via `ARG` no build (padrão: `dev`).

Os logs de inicialização e de cada requisição são gravados em `/logs/app.log`, mapeado como volume.

## Build

```bash
docker build -t node-exercicio .
```

## Run

```bash
docker run -p 3000:3000 -v $(pwd)/logs:/logs node-exercicio Carlos
```

Acesse `http://localhost:3000`.

## Build com modo customizado

```bash
docker build --build-arg MODO=prod -t node-exercicio .
```
