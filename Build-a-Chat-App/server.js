import http from 'http';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { WebSocketServer } from 'ws';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const PORT = 3001;

const server = http.createServer((req, res) => {
  const filePath = path.join(__dirname, 'public', 'index.html');
  fs.readFile(filePath, (err, data) => {
    if (err) {
      res.writeHead(500, { 'Content-Type': 'text/plain' });
      res.end('Internal Server Error');
      return;
    }
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(data);
  });
});

const wss = new WebSocketServer({ server });

function broadcast(data) {
  const messageStr = JSON.stringify(data);
  wss.clients.forEach((client) => {
    if (client.readyState === client.OPEN) {
      client.send(messageStr);
    }
  });
}

wss.on('connection', (socket, req) => {
  
  const username = new URL(req.url, "http://localhost").searchParams.get("username");
  
  broadcast({ type: "system", text: `${username} joined` });

  socket.on('message', (message) => {
    try {
      const parsedMessage = JSON.parse(message);
      broadcast({
        type: 'chat',
        username: parsedMessage.username,
        text: parsedMessage.text
      });
    } catch (e) {
      console.error('Failed to parse incoming message:', e);
    }
  });

  socket.on('close', () => {
    broadcast({ type: 'system', text: `${username} left` });
  });
});

server.listen(PORT, () => {
  console.log(`Chat server running at http://localhost:${PORT}`);
});