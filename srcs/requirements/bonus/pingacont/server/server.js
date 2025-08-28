const { exec } = require('child_process')

async function pinger(host) {
  return new Promise((resolve, reject) => {
    exec(`ping -c 1 ${host}`, (error, stdout, stderr) => {
      if (error) {
        resolve(false);
      } else {
        resolve(true);
      }
    });
  });
}

const express = require('express');
const app = express();
const path = require('path');
const PORT = process.env.PINGACONT_PORT || 6199;


app.get("/check", async (req, res) => {
  const host = req.query.host;
  const result = await pinger(host);
  res.json({ host, reachable: result });
});


app.set('port', PORT);

app.use(express.static(path.join(__dirname, 'public')));

app.use((req, res) => {
    res.status(404);
    res.send('<h1>404 PAGE NOT FOUND</h1>')
})

app.listen(PORT, 
        () => console.log(`Running fast and furious at http://localhost:${PORT}`))