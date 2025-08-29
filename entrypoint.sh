#!/bin/bash
set -e

echo "Current user is: $(whoami)"
echo "Current directory is: $(pwd)"
echo "Home: $HOME"

echo "[INFO] Creating runpod folder"
mkdir -p "$HOME/.runpod"

# exec /bin/bash
# # echo "[INFO] Configuring runpodctl CLI with injected secret..."
echo $apirp
: > "$HOME/.runpod/.runpod.yaml"
runpodctl config --apiKey $apirp || true

# # Set Redis password from environment variable
# if [ -n "$REDIS_PASSWORD" ]; then
#     echo "$REDIS_PASSWORD" 
#     echo "Setting Redis password..."
#     echo "requirepass $REDIS_PASSWORD" > /etc/redis/password.conf
#     echo -e "\ninclude /etc/redis/password.conf" >> /etc/redis/redis.conf
# fi

# cat /etc/redis/redis.conf 

# # Start Redis server with custom config in background
# redis-server /etc/redis/redis.conf --daemonize yes

# # Wait for Redis to start (with retry logic)
# for i in {1..10}; do
#     if redis-cli ping &>/dev/null; then
#         break
#     fi
#     sleep 1
# done

# echo "Detected $(nproc) CPU cores"

# # Start FastAPI app
# uvicorn lb_endpoint:app --host 0.0.0.0 --port 8000 --workers $(nproc) &

python3 lb.py