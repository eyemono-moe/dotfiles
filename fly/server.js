const http = require('node:http')

const redirectUrl = 'https://raw.githubusercontent.com/eyemono-moe/dotfiles/refs/heads/main/index.sh';

const server = http.createServer((req, res) => {
  res.writeHead(301, { Location: redirectUrl });
  res.end();
});

const port = process.env.PORT || 8080;
server.listen(port, () => {
  console.log(`Redirect server running on port ${port}…`);
});