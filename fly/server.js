const http = require('node:http')

const redirectUrl = 'https://raw.githubusercontent.com/eyemono-moe/dotfiles/refs/heads/main/index.sh';

const server = http.createServer((_, res) => {
  res.writeHead(301, { Location: redirectUrl });
  res.end();
});

const port = process.env.PORT || 3000;
server.listen(port, () => {
  console.log(`Redirect server running on port ${port}…`);
});