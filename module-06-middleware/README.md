# Module 06: Middleware & Layers

Master Tower middleware integration in Axum.

## 🎯 What You'll Learn

- Built-in Tower-HTTP middleware
- Custom middleware with `from_fn`
- Layer ordering
- Route-specific middleware
- Authentication middleware

## 🚀 Running

```bash
cargo run
```

## 📝 Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | Public - welcome |
| GET | `/public` | Public - JSON data |
| GET | `/slow` | 1 second delay |
| GET | `/protected/data` | Requires API key |

## 💡 Middleware Patterns

### Custom Middleware
```rust
async fn logging(request: Request, next: Next) -> Response {
    let start = Instant::now();
    let response = next.run(request).await;
    tracing::info!("Request took {:?}", start.elapsed());
    response
}

app.layer(middleware::from_fn(logging))
```

### Built-in Middleware
```rust
use tower_http::{cors::CorsLayer, timeout::TimeoutLayer};

app.layer(CorsLayer::permissive())
   .layer(TimeoutLayer::new(Duration::from_secs(30)))
```

### Route-Specific Middleware
```rust
let protected = Router::new()
    .route("/data", get(handler))
    .route_layer(middleware::from_fn(auth_check));
```

## ⚠️ Layer Order

Layers apply in **reverse order** - last added runs first!

```rust
app.layer(a).layer(b).layer(c)
// Request flows: c -> b -> a -> handler -> a -> b -> c
```

## 🧪 Try It

```bash
# Public endpoint
curl http://localhost:3000/public

# Protected (will fail)
curl http://localhost:3000/protected/data

# Protected with API key
curl -H "X-API-Key: secret-key" http://localhost:3000/protected/data

# Check response timing header
curl -v http://localhost:3000/
```

## ▶️ Next Module

Continue to [Module 07: Error Handling](../module-07-errors)
