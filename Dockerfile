FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    redis \
    && rm -rf /var/lib/apt/lists/*

# Install system packages
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    bash \
    gnupg \
    ca-certificates \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/runpod/runpodctl/releases/download/v1.14.3/runpodctl-linux-amd64 \
    -O /usr/local/bin/runpodctl \
 && chmod +x /usr/local/bin/runpodctl

WORKDIR /app

# Create Redis config directory
RUN mkdir -p /etc/redis

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Copy Redis configuration
COPY redis.conf /etc/redis/redis.conf

# Make entrypoint executable
RUN chmod +x entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["./entrypoint.sh"]