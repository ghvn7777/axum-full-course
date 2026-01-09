# Module 01: Introduction to Axum

Welcome to the first module! Here you'll learn the fundamentals of building web servers with Axum.

## 🎯 What You'll Learn

- Setting up a basic Axum server
- Creating route handlers
- Using `axum::serve` (new in Axum 0.8+)
- Understanding the Router type
- Returning different response types

## 🚀 Running This Module

```bash
cargo run
```

Server starts at: http://localhost:3000

## 📝 Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | Hello World |
| GET | `/hello` | Welcome message |
| GET | `/health` | Health check |
| GET | `/created` | Status code example |
| POST | `/echo` | Echo back message |

## 💡 Try It

```bash
# Basic request
curl http://localhost:3000/

# Echo endpoint
curl -X POST -d "Hello Axum!" http://localhost:3000/echo
```

## 📚 Key Concepts

### Handler Functions
```rust
async fn hello() -> &'static str {
    "Hello, World!"
}
```

### axum::serve (New in 0.8)
```rust
let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await?;
axum::serve(listener, app).await?;
```

## ▶️ Next Module

Continue to [Module 02: Routing](../module-02-routing) to learn about path parameters and nested routes.
