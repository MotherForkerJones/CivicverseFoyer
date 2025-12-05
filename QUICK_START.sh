#!/bin/bash

# CivicverseFoyer - 6-Machine Distributed Stack Quick Start

set -e

COMPOSE_FILE="docker-compose.distributed.yml"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$PROJECT_DIR"

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║         CivicverseFoyer - 6-Machine Distributed Stack         ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

case "${1:-start}" in
  start)
    echo "🚀 Starting all services..."
    docker compose -f "$COMPOSE_FILE" up -d
    echo "✅ All services started!"
    echo ""
    echo "Waiting for services to be ready..."
    sleep 5
    ;;
  
  stop)
    echo "🛑 Stopping all services..."
    docker compose -f "$COMPOSE_FILE" down
    echo "✅ All services stopped!"
    ;;
  
  restart)
    echo "🔄 Restarting all services..."
    docker compose -f "$COMPOSE_FILE" restart
    echo "✅ All services restarted!"
    ;;
  
  logs)
    echo "📋 Showing live logs (Ctrl+C to exit)..."
    docker compose -f "$COMPOSE_FILE" logs -f
    ;;
  
  status)
    echo "📊 Service Status:"
    echo ""
    docker compose -f "$COMPOSE_FILE" ps
    ;;
  
  clean)
    echo "🧹 Cleaning up containers and volumes..."
    docker compose -f "$COMPOSE_FILE" down -v
    echo "✅ Cleanup complete!"
    ;;
  
  rebuild)
    echo "🔨 Rebuilding images..."
    docker compose -f "$COMPOSE_FILE" build --no-cache
    echo "✅ Rebuild complete!"
    ;;
  
  test)
    echo "🧪 Testing API endpoints..."
    echo ""
    echo "Health check:"
    curl -s http://localhost:3001/api/health | jq . 2>/dev/null || curl -s http://localhost:3001/api/health
    echo ""
    echo "Market items:"
    curl -s http://localhost:3001/api/market | jq . 2>/dev/null || curl -s http://localhost:3001/api/market
    echo ""
    ;;
  
  help|--help|-h)
    echo "Usage: $0 [command]"
    echo ""
    echo "Commands:"
    echo "  start      - Start all services (default)"
    echo "  stop       - Stop all services"
    echo "  restart    - Restart all services"
    echo "  status     - Show service status"
    echo "  logs       - Show live logs"
    echo "  clean      - Remove containers and volumes"
    echo "  rebuild    - Rebuild Docker images"
    echo "  test       - Test API endpoints"
    echo "  help       - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 start       # Start everything"
    echo "  $0 logs        # Watch live logs"
    echo "  $0 status      # Check service status"
    echo "  $0 test        # Test API endpoints"
    echo ""
    exit 0
    ;;
  
  *)
    echo "❌ Unknown command: $1"
    echo "Use '$0 help' for usage information"
    exit 1
    ;;
esac

echo ""
echo "📌 Useful Links:"
echo "   🌐 Frontend:     http://localhost"
echo "   🔌 Backend API:  http://localhost:3001"
echo "   🚀 Gateway:      http://localhost:8080"
echo "   💾 Database:     postgresql://civicverse@localhost:5432/civicverse"
echo ""
echo "📚 Documentation:   See DISTRIBUTED_DEPLOYMENT.md"
echo ""
