import { spawn } from "node:child_process";
import http from "node:http";
const PORT = process.env.PORT || 8080;
const REPO = process.env.REPO_PATH || "/data/repo";
const child = spawn("python", ["-m", "mcp_server_git", "--repository", REPO], {
  stdio: ["pipe", "pipe", "inherit"], env: process.env
});
const srv = http.createServer((req, res) => {
  if (req.method === "GET" && req.url === "/health") { res.writeHead(200, {"content-type":"text/plain"}); return res.end("ok"); }
  if (req.method !== "POST") { res.writeHead(405, {"content-type":"text/plain"}); return res.end("Method Not Allowed"); }
  res.writeHead(200, {"content-type":"application/x-ndjson"});
  req.pipe(child.stdin, { end: false }); child.stdout.pipe(res);
});
srv.listen(PORT, "0.0.0.0", () => console.log(`MCP bridge listening on :${PORT}, repo=${REPO}`));
child.on("exit", (code) => { console.error(`mcp_server_git exited with code ${code}`); process.exit(1); });
