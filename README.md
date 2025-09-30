# Aminator3000 Git MCP Server

This repository contains a **Git MCP server** that exposes Git operations (such as viewing commits and diffs) through the [Model Context Protocol (MCP)](https://github.com/modelcontextprotocol).  

It was designed to make Git functionality available to MCP-enabled hosts like Claude Desktop or ChatGPT.

---

## 🚀 Features

- Exposes **Git commands** as MCP tools:
  - Show last N commits
  - Show diff of the most recent commit
- Supports both **local (stdio)** and **remote (HTTP)** modes
- Containerized with **Docker** for easy deployment
- Verified on **Railway** with `/health` endpoint

---

## 📦 Repository Structure

├── Dockerfile      # Container definition
├── server.js       # Node.js HTTP bridge to MCP Git server
└── README.md       # Project documentation

---

## 🛠️ Local Development

### Requirements
- Python 3.11+
- Node.js + npm
- Git

### Install dependencies

```bash
pip install mcp-server-git
