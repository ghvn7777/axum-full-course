# Module 12: Production Ready

Deploy Axum applications to production.

## 🎯 What You'll Learn

- Graceful shutdown
- Structured logging with tracing
- Health & readiness probes
- Docker deployment
- Connection limiting

## 🚀 Running

```bash
# With JSON logging
RUST_LOG=info cargo run

# Test graceful shutdown with Ctrl+C
```

## 📝 Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | Main endpoint |
| GET | `/health` | Liveness probe |
| GET | `/ready` | Readiness probe |
| GET | `/metrics` | Request metrics |

## 💡 Production Patterns

### Graceful Shutdown
```rust
axum::serve(listener, app)
    .with_graceful_shutdown(shutdown_signal())
    .await?;

async fn shutdown_signal() {
    tokio::signal::ctrl_c().await.expect("Failed to listen");
    tracing::info!("Shutdown signal received");
}
```

### Structured Logging
```rust
tracing_subscriber::registry()
    .with(tracing_subscriber::fmt::layer().json())
    .with(EnvFilter::from_default_env())
    .init();
```

### Health Checks
```rust
// Liveness - is the app running?
async fn health() -> &'static str { "OK" }

// Readiness - can it handle requests?
async fn ready(State(state): State<AppState>) -> Result<...> {
    if state.ready.load(Ordering::SeqCst) {
        Ok("ready")
    } else {
        Err(StatusCode::SERVICE_UNAVAILABLE)
    }
}
```

## 🐳 Docker Deployment

```bash
# Build and run
docker build -t axum-app .
docker run -p 3000:3000 axum-app

# Or with docker-compose (from project root)
docker-compose up
```

## 🧪 Testing Health Probes

```bash
# Liveness
curl http://localhost:3000/health

# Readiness
curl http://localhost:3000/ready

# Metrics
curl http://localhost:3000/metrics
```

## ✅ Production Checklist

- [ ] Structured JSON logging enabled
- [ ] Health/readiness endpoints configured
- [ ] Graceful shutdown implemented
- [ ] Request timeouts set
- [ ] CORS configured for your domain
- [ ] TLS termination (nginx/load balancer)
- [ ] Environment variables for secrets

## 🎉 Course Complete!

Congratulations! You've completed the Axum Full Course.

Go back to the [main README](../README.md) for the full course overview.
