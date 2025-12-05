-- Initialize Civicverse Database
CREATE TABLE IF NOT EXISTS citizens (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  balance REAL DEFAULT 1000.0,
  created INTEGER DEFAULT EXTRACT(EPOCH FROM NOW()),
  cls TEXT,
  level INTEGER DEFAULT 1
);

CREATE TABLE IF NOT EXISTS market (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  price REAL NOT NULL,
  sellerId TEXT,
  created INTEGER DEFAULT EXTRACT(EPOCH FROM NOW())
);

CREATE TABLE IF NOT EXISTS quests (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  reward REAL NOT NULL,
  claimed BOOLEAN DEFAULT false,
  claimedBy TEXT,
  difficulty TEXT DEFAULT 'Medium',
  created INTEGER DEFAULT EXTRACT(EPOCH FROM NOW())
);

CREATE TABLE IF NOT EXISTS miner_pool (
  id TEXT PRIMARY KEY,
  hashRate REAL,
  shares INTEGER DEFAULT 0,
  updated INTEGER DEFAULT EXTRACT(EPOCH FROM NOW())
);

CREATE TABLE IF NOT EXISTS treasury (
  id SERIAL PRIMARY KEY,
  balance REAL DEFAULT 10000.0,
  currency TEXT DEFAULT 'CVT',
  multisig TEXT,
  updated INTEGER DEFAULT EXTRACT(EPOCH FROM NOW())
);

CREATE TABLE IF NOT EXISTS ubi (
  id SERIAL PRIMARY KEY,
  pool REAL DEFAULT 50000.0,
  currency TEXT DEFAULT 'CVT',
  lastDistributed INTEGER DEFAULT EXTRACT(EPOCH FROM NOW()),
  updated INTEGER DEFAULT EXTRACT(EPOCH FROM NOW())
);

-- Seed demo data
INSERT INTO market (title, price, sellerId) VALUES
  ('Enchanted Sword', 100, NULL),
  ('Health Potion', 25, NULL),
  ('Mana Elixir', 50, NULL),
  ('Invisibility Cloak', 500, NULL),
  ('Ancient Tome', 200, NULL)
ON CONFLICT DO NOTHING;

INSERT INTO quests (title, reward, difficulty) VALUES
  ('Defeat Goblin King', 500, 'Hard'),
  ('Collect 10 Mushrooms', 100, 'Easy'),
  ('Rescue the Princess', 1000, 'Legendary'),
  ('Mine 100 Coins', 250, 'Medium'),
  ('Explore the Dungeon', 300, 'Medium')
ON CONFLICT DO NOTHING;

INSERT INTO treasury (balance, currency, multisig) VALUES
  (10000.0, 'CVT', '0xDEMO_MULTISIG_ADDRESS')
ON CONFLICT DO NOTHING;

INSERT INTO ubi (pool, currency) VALUES
  (50000.0, 'CVT')
ON CONFLICT DO NOTHING;
