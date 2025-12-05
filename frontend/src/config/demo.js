// Demo mode configuration for Civicverse
export const DEMO_MODE = true
export const ENABLE_ALL_FEATURES = true

// Mock data for demo
export const DEMO_CITIZEN = {
  id: 'demo-user-001',
  name: 'DemoUser',
  balance: 5000,
  class: 'Adventurer',
  level: 5,
  experience: 1250
}

export const DEMO_MARKETPLACE = [
  { id: 1, title: 'Enchanted Sword', price: 100, sellerId: 'vendor-1' },
  { id: 2, title: 'Health Potion', price: 25, sellerId: 'vendor-2' },
  { id: 3, title: 'Mana Elixir', price: 50, sellerId: 'vendor-3' },
  { id: 4, title: 'Invisibility Cloak', price: 500, sellerId: 'vendor-4' },
  { id: 5, title: 'Ancient Tome', price: 200, sellerId: 'vendor-5' }
]

export const DEMO_QUESTS = [
  { id: 1, title: 'Defeat Goblin King', reward: 500, difficulty: 'Hard', claimed: 0 },
  { id: 2, title: 'Collect 10 Mushrooms', reward: 100, difficulty: 'Easy', claimed: 0 },
  { id: 3, title: 'Rescue the Princess', reward: 1000, difficulty: 'Legendary', claimed: 0 },
  { id: 4, title: 'Mine 100 Coins', reward: 250, difficulty: 'Medium', claimed: 0 },
  { id: 5, title: 'Explore the Dungeon', reward: 300, difficulty: 'Medium', claimed: 0 }
]

export const DEMO_MINING = {
  status: 'mining',
  hashRate: 1250000,
  shares: 42,
  difficulty: 4096,
  poolWorkers: 156,
  earnings: 3.54
}

export const DEMO_UBI = {
  pool: 50000,
  currency: 'CVT',
  lastDistributed: Date.now(),
  yourShare: 125
}

export const DEMO_NEWS = [
  { id: 1, title: 'New Mining Pool Update', content: 'Network efficiency improved by 15%', timestamp: Date.now() - 3600000 },
  { id: 2, title: 'Marketplace Surge', content: 'Trading volume up 200% this week', timestamp: Date.now() - 7200000 },
  { id: 3, title: 'Quest Completion Records', content: 'Community completes 1000 quests', timestamp: Date.now() - 86400000 }
]

// API Config
export const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:3001'
export const SOCKET_IO_URL = import.meta.env.VITE_SOCKET_IO_URL || 'http://localhost:3001'

// Feature Flags
export const FEATURES = {
  marketplace: true,
  mining: true,
  quests: true,
  ubi: true,
  pvp: true,
  school: true,
  games: true,
  news: true,
  marketplace_trading: true,
  real_blockchain: false, // Demo mode - disable real blockchain
  offline_mode: true
}
