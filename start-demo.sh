#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

REPO_DIR="/home/civicverseuser/CivicverseFoyer"

echo -e "${BLUE}Starting Civicverse Demo...${NC}"

# Create logs directory
mkdir -p "$REPO_DIR/logs"

# Start backend
echo -e "${GREEN}[1/3] Starting backend server on port 8081...${NC}"
cd "$REPO_DIR/backend"
npm start > "$REPO_DIR/logs/backend.log" 2>&1 &
BACKEND_PID=$!
echo "Backend PID: $BACKEND_PID"

# Wait for backend to start
sleep 2

# Start miner (optional)
echo -e "${GREEN}[2/3] Starting miner service on port 9090...${NC}"
cd "$REPO_DIR/miner"
npm start > "$REPO_DIR/logs/miner.log" 2>&1 &
MINER_PID=$!
echo "Miner PID: $MINER_PID"

# Wait for miner to start
sleep 2

# Start frontend
echo -e "${GREEN}[3/3] Starting frontend on port 5173...${NC}"
cd "$REPO_DIR/frontend"
npm run dev > "$REPO_DIR/logs/frontend.log" 2>&1 &
FRONTEND_PID=$!
echo "Frontend PID: $FRONTEND_PID"

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}✓ Civicverse Demo is starting!${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo "Services:"
echo "  Frontend:  http://localhost:5173"
echo "  Backend:   http://localhost:8081"
echo "  Miner:     http://localhost:9090"
echo ""
echo "Log files:"
echo "  Frontend:  $REPO_DIR/logs/frontend.log"
echo "  Backend:   $REPO_DIR/logs/backend.log"
echo "  Miner:     $REPO_DIR/logs/miner.log"
echo ""
echo "To stop all services, run: pkill -f 'npm'"
echo ""

# Keep the script running
wait
