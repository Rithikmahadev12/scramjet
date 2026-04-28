import { createServer } from "http";
import { createReadStream, statSync } from "fs";
import { join, extname } from "path";

const DIST = "./packages/demo/dist";
const PORT = process.env.PORT || 3000;

const mime = {
  ".html": "text/html", ".js": "application/javascript",
  ".mjs": "application/javascript", ".css": "text/css",
  ".wasm": "application/wasm", ".json": "application/json",
  ".png": "image/png", ".svg": "image/svg+xml",
};

createServer((req, res) => {
  let path = join(DIST, req.url === "/" ? "/index.html" : req.url);
  try {
    statSync(path);
  } catch {
    path = join(DIST, "index.html");
  }
  const ext = extname(path);
  res.setHeader("Content-Type", mime[ext] || "text/plain");
  createReadStream(path).pipe(res);
}).listen(PORT, () => console.log(`Listening on ${PORT}`));
