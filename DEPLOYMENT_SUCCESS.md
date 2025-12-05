# 🎮 CivicverseFoyer - 6-Machine Distributed Stack

## ✅ DEPLOYMENT COMPLETE

Your Civicverse platform is now running across a 6-machine distributed architecture with **ALL FEATURES ENABLED in demo mode**.

---

## 🚀 Access Your Platform

**Main Frontend**: [http://localhost](http://localhost)

Try these features immediately:
- 🛍️ **Marketplace** - Browse and trade digital items
- ⛏️ **Mining** - Monitor mining pool and earnings
- 🎯 **Quests** - Complete missions and earn rewards
- 💰 **UBI** - Check Universal Basic Income distribution
- 🎮 **Games** - Play Fighter and Pong
- 📚 **School** - Access educational content
- 📰 **News Feed** - Get latest updates

---

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────────┐
│              6-Machine Distributed Stack            │
├─────────────────────────────────────────────────────┤
│                                                     │
│  MACHINE 1: Frontend                  (Port 80)    │
│  MACHINE 2: Backend API               (Port 3001)  │
│  MACHINE 3: Blockchain Nodes          (Port 16110) │
│  MACHINE 4: Mining Pool               (Port 9090)  │
│  MACHINE 5: Smart Contracts (Hardhat) (Port 8545)  │
│  MACHINE 6: PostgreSQL Database       (Port 5432)  │
│                                                     │
│  + GATEWAY: Caddy Proxy               (Port 8080)  │
└─────────────────────────────────────────────────────┘
```

All services are running in Docker containers on your local machine, simulating a distributed multi-machine deployment.

---

## 📊 Service Status

All 7 services are **UP and HEALTHY**:

| Service | Status | Port | URL |
|---------|--------|------|-----|
| Frontend | ✅ Up | 80 | http://localhost |
| Backend API | ✅ Up | 3001 | http://localhost:3001 |
| Blockchain | ✅ Up | 16110 | localhost:16110 |
| Mining | ✅ Up | 9090 | localhost:9090 |
| Hardhat | ✅ Up | 8545 | http://localhost:8545 |
| Database | ✅ Up | 5432 | localhost:5432 |
| Gateway | ✅ Up | 8080 | http://localhost:8080 |

---

## 🎯 Quick Commands

### Check Service Status
```bash
cd ~/CivicverseFoyer
docker compose -f docker-compose.distributed.yml ps
```

### View Live Logs
```bash
docker compose -f docker-compose.distributed.yml logs -f
```

### Test API Endpoints
```bash
# Health check
curl http://localhost:3001/api/health

# Get marketplace items
curl http://localhost:3001/api/market

# Get quests
curl http://localhost:3001/api/quests
```

### Stop Everything
```bash
docker compose -f docker-compose.distributed.yml down
```

### Start Everything Again
```bash
docker compose -f docker-compose.distributed.yml up -d
```

---

## 📝 Demo Data Included

Your demo comes pre-populated with:

**Marketplace**
- Neon Jacket ($3.50)
- Pixel Car ($12.00)

**Quests**
- Find the Neon Key (0.5 reward)
- Deliver Packet (0.2 reward)

**Economy**
- Treasury: 10,000 CVT
- UBI Pool: 50,000 CVT

---

## 🔧 Configuration Files

**Main Deployment**
- `docker-compose.distributed.yml` - 6-machine stack definition

**Application Code**
- `frontend/` - React/Vite UI with all features
- `backend/index.js` - Node.js Express API
- `smart-contracts/` - Ethereum contracts (Hardhat)

**Documentation**
- `DISTRIBUTED_DEPLOYMENT.md` - Full deployment guide
- `README.md` - General information

---

## 🌟 Features Enabled

✅ Marketplace trading
✅ Mining pool management  
✅ Quest system with rewards
✅ UBI distribution
✅ PvP games (Fighter, Pong)
✅ School/Learning
✅ News feed
✅ Character creation
✅ Wallet integration
✅ Citizen management
✅ Off-chain demo mode (no real blockchain needed)

---

## 🔗 API Endpoints

**Health & Status**
- `GET /api/health` - Server health check
- `GET /api/news` - News feed

**Marketplace**
- `GET /api/market` - Get all items
- `POST /api/market/create` - Create new listing

**Quests**
- `GET /api/quests` - Get available quests
- `POST /api/quests/claim` - Claim quest reward

**Mining**
- `GET /api/miner` - Miner config
- `GET /api/miner/status` - Mining status

---

## 📚 Next Steps

1. **Explore the UI** - Open http://localhost in your browser
2. **Create a character** - Start the onboarding
3. **Complete quests** - Earn rewards
4. **Trade items** - Use the marketplace
5. **Check logs** - View service activity: `docker compose logs -f`

---

## 🐛 Troubleshooting

**Services not starting?**
```bash
docker compose -f docker-compose.distributed.yml logs
```

**Port already in use?**
```bash
# Kill process using the port
lsof -i :3001
kill -9 <PID>
```

**Database connection issues?**
```bash
# Connect directly
psql -h localhost -U civicverse -d civicverse -W
```

**Frontend not loading?**
- Check: http://localhost:80/
- Try: http://localhost:3000/
- Rebuild: `docker compose build --no-cache civicverse-frontend`

---

## 📖 Documentation

For complete details, see:
- **`DISTRIBUTED_DEPLOYMENT.md`** - Full deployment guide with scaling info
- **`backend/README.md`** - Backend API documentation
- **`frontend/README.md`** - Frontend development guide

---

## 🎉 You're All Set!

Your Civicverse distributed demo platform is ready to explore with all features enabled. Enjoy!

For questions or issues, check the logs with `docker compose logs -f` or review the full documentation.

---

**Deployment Info:**
- 📅 Deployed: Dec 5, 2025
- 🏢 Architecture: 6-Machine Distributed Stack
- 🎮 Mode: Demo (All Features Enabled)
- 🌐 Frontend: Ready to serve
- ✨ Status: ✅ Fully Operational
