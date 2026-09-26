FROM node:18-alpine

# ARG define o valor padrão do modo no momento do BUILD.
# Pode ser sobrescrito com: docker build --build-arg MODO=prod -t node-exercicio .
ARG MODO=dev

# ENV torna o valor de ARG disponível em tempo de execução (dentro do container).
ENV MODO=${MODO}

WORKDIR /app

COPY package.json ./
COPY index.js ./
COPY entrypoint.sh ./

RUN chmod +x entrypoint.sh

# Volume para persistir os logs gerados pela aplicação fora do container.
VOLUME ["/logs"]

EXPOSE 3000

# ENTRYPOINT fixo: sempre passa pelo script, que trata o argumento (NOME)
# e decide o que executar via exec.
ENTRYPOINT ["./entrypoint.sh"]

# CMD é o comando padrão, usado quando "docker run" não passa argumentos.
CMD ["node", "index.js"]
