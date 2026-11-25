const http = require("http");
const BACKEND = process.env.BACKEND_URL;
const esc = (s) => String(s).replace(/[&<>"']/g, (c) => `&#${c.charCodeAt(0)};`);

http
  .createServer(async (req, res) => {
    try {
      const notes = await (await fetch(`${BACKEND}/notes`)).json();
      res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
      res.end(`<h1>Notes</h1><ul>${notes.map((n) => `<li>${esc(n.text)}</li>`).join("")}</ul>`);
    } catch (e) {
      res.writeHead(502);
      res.end("backend unreachable");
    }
  })
  .listen(3000, () => console.log("frontend on :3000"));
