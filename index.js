const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 3000;
const NOME = process.env.NOME || 'visitante';
const MODO = process.env.MODO || 'dev';

const LOG_DIR = '/logs';
const LOG_FILE = path.join(LOG_DIR, 'app.log');

function log(message) {
  const line = `${new Date().toISOString()} - ${message}`;
  console.log(line);
  try {
    fs.mkdirSync(LOG_DIR, { recursive: true });
    fs.appendFileSync(LOG_FILE, line + '\n');
  } catch (err) {
    console.error(`Falha ao gravar log em ${LOG_FILE}:`, err.message);
  }
}

const server = http.createServer((req, res) => {
  log(`Requisicao recebida: ${req.method} ${req.url}`);
  const body = `Olá ${NOME}\nModo: ${MODO}\n`;
  res.writeHead(200, { 'Content-Type': 'text/plain; charset=utf-8' });
  res.end(body);
});

server.listen(PORT, () => {
  log(`Servidor rodando na porta ${PORT} (NOME=${NOME}, MODO=${MODO})`);
});
