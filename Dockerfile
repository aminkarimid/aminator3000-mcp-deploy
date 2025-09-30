FROM python:3.11-slim

# Install the MCP Git server
RUN pip install --no-cache-dir mcp-server-git

# Set work directory
WORKDIR /app

# Expose port 8080 (for HTTP mode)
EXPOSE 8080

# Run the MCP Git server in HTTP mode
CMD ["python","-m","mcp_server_git","--http","--host","0.0.0.0","--port","8080"]
