#!/bin/bash

# Check if target IP/hostname is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <IP or hostname>"
  exit 1
fi

target=$1

echo "Scanning ports on $target..."

for port in {1..1024}; do
  timeout 1 bash -c "echo >/dev/tcp/$target/$port" 2>/dev/null &&
  echo "Port $port is OPEN"
done

echo "Scan complete."
