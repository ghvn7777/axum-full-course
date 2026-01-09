# 🦀 Axum 0.8 Full Course - Build Production REST APIs in Rust (2026)

[![Rust](https://img.shields.io/badge/Rust-1.78+-orange.svg)](https://www.rust-lang.org)
[![Axum](https://img.shields.io/badge/Axum-0.8.8-blue.svg)](https://github.com/tokio-rs/axum)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![YouTube](https://img.shields.io/badge/YouTube-Aarambh_Dev_Hub-red.svg)](https://youtube.com/@AarambhDevHub)

> **Complete 12-module course** covering Axum web framework from beginner to production-ready applications. Built for the YouTube tutorial series by **Aarambh Dev Hub**.

## 📺 Watch on YouTube

� **Full Course Video**: [Coming Soon - Subscribe for notification!](https://youtube.com/@AarambhDevHub)

## �🎯 What You'll Learn

- ✅ Build REST APIs with **Axum 0.8.8** (latest version)
- ✅ Master routing with **NEW path syntax** `/{id}`
- ✅ Extractors - Path, Query, JSON, Headers, Custom
- ✅ State management with `Arc` & `RwLock`
- ✅ Tower middleware - CORS, Compression, Custom
- ✅ Professional error handling with `thiserror`
- ✅ PostgreSQL database with **SQLx**
- ✅ JWT Authentication with **Argon2** password hashing
- ✅ Real-time features - WebSockets & Server-Sent Events
- ✅ File uploads with Multipart
- ✅ Testing strategies for Axum
- ✅ Production deployment with **Docker**

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/aarambh-darshan/axum-full-course.git
cd axum-full-course

# Build all modules
cargo build --workspace

# Run a specific module
cargo run -p module-01-intro

# Run tests
cargo test --workspace
```

## 📋 Prerequisites

- **Rust 1.78+** installed ([Install Rust](https://rustup.rs))
- Basic Rust knowledge (ownership, traits, async/await)
- (Optional) **Docker** for database modules
- (Optional) **PostgreSQL** for Modules 08-09

## 📚 Course Modules

| Module | Topic | Description | Port |
|--------|-------|-------------|------|
| [01](./module-01-intro) | **Introduction** | Hello World, `axum::serve`, basic handlers | 3000 |
| [02](./module-02-routing) | **Routing** | Path params `/{id}`, nesting, HTTP methods | 3000 |
| [03](./module-03-extractors) | **Extractors** | Path, Query, Json, Headers, custom extractors | 3000 |
| [04](./module-04-responses) | **Responses** | IntoResponse, Json, Html, status codes | 3000 |
| [05](./module-05-state) | **State** | Arc, RwLock, shared mutable state | 3000 |
| [06](./module-06-middleware) | **Middleware** | Tower, CORS, compression, custom middleware | 3000 |
| [07](./module-07-errors) | **Errors** | Custom error types, thiserror, error handling | 3000 |
| [08](./module-08-database) | **Database** | SQLx, PostgreSQL, CRUD operations | 3000 |
| [09](./module-09-auth) | **Authentication** | JWT, Argon2 hashing, protected routes | 3000 |
| [10](./module-10-advanced) | **Advanced** | WebSockets, SSE, file uploads | 3000 |
| [11](./module-11-testing) | **Testing** | Unit tests, integration tests, oneshot | 3000 |
| [12](./module-12-production) | **Production** | Docker, graceful shutdown, tracing | 3000 |

## ⚡ What's New in Axum 0.8

This course covers the **latest Axum 0.8.8** features:

| Feature | Old Syntax | New Syntax |
|---------|------------|------------|
| Path Parameters | `/:id` | `/{id}` ✨ |
| Custom Extractors | `#[async_trait]` required | Native async traits ✨ |
| Optional Extractors | Manual handling | `OptionalFromRequestParts` ✨ |
| Connection Limiting | External | `ListenerExt::limit_connections` ✨ |

## 🛠️ Project Structure

```
axum-full-course/
├── Cargo.toml                 # Workspace manifest with shared dependencies
├── README.md                  # This file
├── .env.example               # Environment variables template
├── Dockerfile                 # Production Docker image
├── docker-compose.yml         # Local development stack
│
├── module-01-intro/           # Each module is a separate crate
│   ├── Cargo.toml
│   ├── README.md              # Module-specific instructions
│   └── src/main.rs
│
├── module-02-routing/
├── module-03-extractors/
├── module-04-responses/
├── module-05-state/
├── module-06-middleware/
├── module-07-errors/
├── module-08-database/
├── module-09-auth/
├── module-10-advanced/
├── module-11-testing/
└── module-12-production/
```

## 📝 Running Individual Modules

Each module is self-contained and can be run independently:

```bash
# Module 01: Basic server (no dependencies)
cargo run -p module-01-intro
# Visit: http://localhost:3000

# Module 08: Requires PostgreSQL
cd module-08-database
docker-compose up -d postgres    # Start PostgreSQL
cargo run -p module-08-database
# Visit: http://localhost:3000/users

# Module 10: WebSockets & SSE
cargo run -p module-10-advanced
# WebSocket: ws://localhost:3000/ws
# SSE: http://localhost:3000/sse
```

## 🐳 Docker Setup

```bash
# Start PostgreSQL for database modules
docker-compose up -d postgres

# Build production image
docker build -t axum-course .

# Run with Docker Compose (app + postgres)
docker-compose up
```

## 🧪 Testing

```bash
# Run all tests
cargo test --workspace

# Run specific module tests
cargo test -p module-11-testing

# Run with output
cargo test --workspace -- --nocapture

# Run tests matching a name
cargo test health_check
```

## � Environment Variables

Copy `.env.example` to `.env` and configure:

```env
# Database (Module 08, 09)
DATABASE_URL=postgres://postgres:postgres@localhost:5432/axum_course

# JWT Authentication (Module 09)
JWT_SECRET=your-super-secret-key-change-in-production

# Server
RUST_LOG=info
HOST=0.0.0.0
PORT=3000
```

## 📖 Learning Resources

- [Axum Documentation](https://docs.rs/axum)
- [Tokio Tutorial](https://tokio.rs/tokio/tutorial)
- [SQLx Documentation](https://docs.rs/sqlx)
- [Tower Service](https://docs.rs/tower)

## 🤝 Contributing

Found a bug or want to improve the code?

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 💬 Community

- 📺 [YouTube - Aarambh Dev Hub](https://youtube.com/@AarambhDevHub)
- 💻 [GitHub - aarambh-darshan](https://github.com/aarambh-darshan)
- 🐦 [Twitter/X](https://twitter.com/your-handle)
- 💬 [Discord Community](https://discord.gg/your-server)

## ☕ Support

If this course helped you, consider:

- ⭐ Starring this repository
- 📺 Subscribing to the YouTube channel
- ☕ [Buy Me a Coffee](https://buymeacoffee.com/your-link)

## 📄 License

MIT License - feel free to use this code for learning and projects!

---

**Made with ❤️ by [Aarambh Dev Hub](https://youtube.com/@AarambhDevHub) for the Rust community** 🦀
