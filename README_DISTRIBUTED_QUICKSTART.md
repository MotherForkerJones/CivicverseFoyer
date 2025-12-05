Distributed Quick Start

Prerequisites: Docker & Docker Compose (use `docker compose`), ports 80/3001/5432 free.

Start locally using the distributed compose:

```bash
cd /home/civicverseuser/CivicverseFoyer
docker compose -f docker-compose.distributed.yml build
docker compose -f docker-compose.distributed.yml up -d
```

Verify:

```bash
docker compose -f docker-compose.distributed.yml ps
curl -sS http://localhost:3001/api/health
```

To stop:

```bash
docker compose -f docker-compose.distributed.yml down
```

For details, see `DISTRIBUTED_DEPLOYMENT.md` and `QUICK_START.sh` in the repo.
