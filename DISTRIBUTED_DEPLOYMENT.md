# CivicverseFoyer - 6-Machine Distributed Stack

## Overview

This is a complete 6-machine distributed architecture for the Civicverse platform. Each machine runs a dedicated service on the stack:

- **Machine 1**: Frontend Server (UI/Dashboard)
- **Machine 2**: Backend API (Core Services)
- **Machine 3**: Blockchain Nodes (Kaspa, Monero placeholders)
- **Machine 4**: Mining Pool
- **Machine 5**: Smart Contract Executor (Hardhat)
- **Machine 6**: Database & Persistence (PostgreSQL)

## Quick Start

### Prerequisites
- Docker & Docker Compose installed
- At least 4GB RAM available
- Ports: 80, 443, 3000, 3001, 5173, 8080, 8545, 9090, 16110, 18081, 18083 available

### Launch All Services

```bash
cd /home/civicverseuser/CivicverseFoyer
docker compose -f docker-compose.distributed.yml up -d
```

### Check Service Status

```bash
docker compose -f docker-compose.distributed.yml ps
```

### View Live Logs

```bash
# All services
docker compose -f docker-compose.distributed.yml logs -f

# Specific service
docker compose -f docker-compose.distributed.yml logs -f civicverse-frontend
docker compose -f docker-compose.distributed.yml logs -f civicverse-backend
```

## Service Endpoints

### Frontend
- **Main UI**: http://localhost:80 or http://localhost:3000
- **Demo Features Enabled**:
  - Marketplace trading system
  - Mining pool interface
  - Quest system with rewards
  - UBI distribution
  - PvP games (Fighter, Pong)
  - School/Education module
  - News feed

### Backend API
- **Base URL**: http://localhost:3001
- **Health Check**: `GET /api/health`
- **Market**: `GET /api/market`
- **Quests**: `GET /api/quests`
- **Miner**: `GET /api/miner`

### Proxy/Gateway
- **Caddy Proxy**: http://localhost:8080
- **Frontend**: http://localhost:80
- **Backend API**: http://localhost:8080 (reversed from :8080)

### Blockchain
- **Kaspa Node**: http://localhost:16110
- **Monero RPC**: http://localhost:18083
- **Hardhat Network**: http://localhost:8545

### Mining
- **Mining Pool**: http://localhost:9090
- **Stratum Protocol**: tcp://localhost:3112

### Database
- **PostgreSQL**: localhost:5432
- **Credentials**: 
  - User: `civicverse`
  - Password: `changeme_security_risk`
  - Database: `civicverse`

## Architecture Details

### Data Flow
```
User Browser
    ↓
Frontend Server (Port 80/3000/5173)
    ↓
Caddy Gateway (Port 8080)
    ↓
Backend API (Port 3001)
    ↓
[Mining Pool] [Database] [Blockchain]
```

### Feature Flags (Demo Mode)
All features are enabled by default:
- ✅ Marketplace with trading
- ✅ Mining pool management
- ✅ Quest completion system
- ✅ UBI distribution
- ✅ PvP games
- ✅ School/Learning
- ✅ News feed
- ✅ Offline demo mode

### Demo Data
The system includes pre-populated demo data:
- **Market Items**: Neon Jacket, Pixel Car, etc.
- **Quests**: Find Neon Key, Deliver Packet, etc.
- **Treasury**: 10,000 CVT
- **UBI Pool**: 50,000 CVT
- **Citizens**: Full onboarding support

## Configuration

### Environment Variables

Set in `docker-compose.distributed.yml`:
```yaml
DEMO_MODE=true              # Enable demo mode (in-memory data fallback)
VITE_DEMO_MODE=true         # Frontend demo mode
VITE_ENABLE_ALL_FEATURES=true # All features enabled
NODE_ENV=production         # Production environment
```

### Database Initialization

Initial schema is automatically created. Demo data is seeded on first run via `/scripts/init-db.sql`.

## Scaling & Customization

### Using Individual Machines

For true multi-machine deployment, you can deploy each service to separate hosts:

```bash
# Machine 1 - Frontend only
docker-compose -f docker-compose.yml up civicverse-frontend

# Machine 2 - Backend only  
docker-compose -f docker-compose.yml up civicverse-backend

# etc...
```

Update service URLs in environment variables for cross-machine communication.

### Customization Points

1. **Frontend Features**: Edit `/frontend/src/App.jsx` to toggle routes
2. **Backend API**: Extend `/backend/index.js` endpoints
3. **Database**: Modify `/scripts/init-db.sql` for schema changes
4. **Proxy Rules**: Update `/Caddyfile` for custom routing

## Troubleshooting

### Services Restarting
Check logs with:
```bash
docker compose -f docker-compose.distributed.yml logs <service-name>
```

### Port Conflicts
If ports are in use:
```bash
# Find what's using a port
lsof -i :3001
# Kill the process
kill -9 <PID>
```

### Database Connection Issues
```bash
# Connect directly to PostgreSQL
psql -h localhost -U civicverse -d civicverse -W
```

### Frontend Not Loading
- Check if build succeeded: `docker compose logs civicverse-frontend`
- Rebuild if needed: `docker compose build --no-cache civicverse-frontend`

## Stopping & Cleanup

```bash
# Stop all services
docker compose -f docker-compose.distributed.yml down

# Remove volumes (WARNING: deletes data)
docker compose -f docker-compose.distributed.yml down -v

# Remove everything including images
docker compose -f docker-compose.distributed.yml down -v --rmi all
```

## Production Deployment

For production:
1. Update `.env` with real credentials
2. Set `NODE_ENV=production`
3. Disable `DEMO_MODE=false` for real database
4. Configure proper SSL/TLS in Caddyfile
5. Use proper secrets management (not hardcoded)
6. Set up monitoring and logging
7. Configure backup strategies for database

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────┐
│                   CLIENT (Web Browser)                  │
└────────────────────────┬────────────────────────────────┘
                         │
                         ↓
        ┌─────────────────────────────────┐
        │   Frontend Server (Machine 1)   │
        │   - React/Vite app              │
        │   - Game Canvas (Phaser)        │
        │   - Demo Mode All Features      │
        └────────────┬────────────────────┘
                     │
                     ↓
        ┌─────────────────────────────────┐
        │   Caddy Proxy Gateway           │
        │   - Route management            │
        │   - SSL/TLS termination         │
        └────────────┬────────────────────┘
                     │
        ┌────────────┴────────────┬──────────────┐
        ↓                         ↓              ↓
   ┌────────────┐  ┌──────────────┐  ┌─────────────────┐
   │ Backend    │  │ Blockchain   │  │ Mining Pool     │
   │ API        │  │ (Kaspa,      │  │ (Stratum)       │
   │ (Machine 2)│  │ Monero)      │  │ (Machine 4)     │
   │            │  │ (Machine 3)  │  │                 │
   └────┬───────┘  └──────────────┘  └─────────────────┘
        │
        ↓
   ┌────────────────────────────────────┐
   │ Database & Persistence (Machine 6) │
   │ - PostgreSQL                       │
   │ - Citizens, Market, Quests         │
   │ - Treasury, UBI Pool               │
   └────────────────────────────────────┘
```

## Support

For issues or questions:
1. Check service logs: `docker compose logs <service>`
2. Verify all containers are running: `docker compose ps`
3. Test API endpoints: `curl http://localhost:3001/api/health`
4. Check database connection: `psql -h localhost -U civicverse`
