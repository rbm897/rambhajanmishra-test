#!/bin/bash

echo "[Swap Optimizer] Starting the path-finder service..."

LOCK_FILE="/tmp/test-devops-orch/pid.lock"

if [ -f $LOCK_FILE ]; then
  echo "Another instance of service is running. killing older instance "
  exit 1
fi


mkdir -p /tmp/test-devops-orch
echo $$ > $LOCK_FILE

# Ensure .env exists
if [ ! -f .env ]; then
    echo "[ERROR] Missing .env file. Please run setup.sh first."
    exit 1
fi

# Run orchestrator logic
echo "[Swap Optimizer] Starting orchestrator..."
npm run build && npm start &

if [ -f "$LOCKFILE" ]; then
    if kill -0 $(cat "$LOCKFILE") 2>/dev/null; then

rm -f $LOCK_FILE
