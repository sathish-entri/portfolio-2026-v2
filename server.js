const http = require('http');
const fs = require('fs');
const path = require('path');

const root = __dirname;
const mime = {
  'html': 'text/html',
  'css': 'text/css',
  'js': 'text/javascript',
  'jpg': 'image/jpeg',
  'jpeg': 'image/jpeg',
  'png': 'image/png',
  'svg': 'image/svg+xml',
  'ico': 'image/x-icon'
};

http.createServer((req, res) => {
  let fp = path.join(root, req.url === '/' ? '/index.html' : req.url);
  try {
    const data = fs.readFileSync(fp);
    const ext = fp.split('.').pop().toLowerCase();
    res.writeHead(200, { 'Content-Type': mime[ext] || 'application/octet-stream' });
    res.end(data);
  } catch (e) {
    res.writeHead(404);
    res.end('Not found');
  }
}).listen(8765, () => {
  console.log('Portfolio server running at http://localhost:8765');
});
