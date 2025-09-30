FROM python:3.11-slim

# Install system dependencies: git + node
RUN apt-get update && apt-get install -y git nodejs npm && rm -rf /var/lib/apt/lists/*

# Install the MCP Git server
RUN pip install --no-cache-dir mcp-server-git

# Clone your aminator3000 repo into the container
ARG REPO_URL=https://github.com/aminkarimid/aminator3000.git
ARG REPO_BRANCH=main
RUN git clone --depth=1 --branch $REPO_BRANCH $REPO_URL /data/repo

# Copy the Node bridge
WORKDIR /app
COPY server.js .

# Expose the HTTP port
EXPOSE 8080

# Environment variable to tell bridge where repo lives
ENV REPO_PATH=/data/repo

# Start the bridge (which spawns the stdio MCP server)
CMD ["node","server.js"]
