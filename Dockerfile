FROM python:3.11-slim
RUN apt-get update && apt-get install -y git nodejs npm && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir mcp-server-git

# --- clone your repo into the image ---
ARG REPO_URL=https://github.com/aminkarimid/aminator3000.git
ARG REPO_BRANCH=main
RUN git clone --depth=1 --branch $REPO_BRANCH $REPO_URL /data/repo

WORKDIR /app
COPY server.js .
EXPOSE 8080
ENV REPO_PATH=/data/repo
CMD ["node","server.js"]
