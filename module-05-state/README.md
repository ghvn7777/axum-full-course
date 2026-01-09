# Module 05: State Management

Learn to manage application state in Axum.

## 🎯 What You'll Learn

- Immutable state with `State<T>`
- Mutable state with `Arc<RwLock<T>>`
- Database connection pools
- Multiple state types
- Extension-based state

## 🚀 Running

```bash
cargo run
```

## 📝 Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/config` | Immutable config |
| GET | `/todos` | List todos |
| POST | `/todos` | Create todo |
| GET | `/todos/{id}` | Get todo |
| PUT | `/todos/{id}` | Update todo |
| DELETE | `/todos/{id}` | Delete todo |
| GET | `/metrics` | Combined state |
| GET | `/me` | Extension state |

## 💡 State Patterns

### Immutable State
```rust
let config = Arc::new(AppConfig { ... });
Router::new().with_state(config)
```

### Mutable State
```rust
type Store = Arc<RwLock<HashMap<String, Todo>>>;

async fn create(State(store): State<Store>) -> ... {
    store.write().unwrap().insert(id, todo);
}
```

### Combined State
```rust
#[derive(Clone)]
struct AppState {
    config: Arc<AppConfig>,
    db: PgPool,
    cache: Arc<RwLock<Cache>>,
}
```

## 🧪 Try It

```bash
# Create a todo
curl -X POST -H "Content-Type: application/json" \
     -d '{"title":"Learn Axum"}' \
     http://localhost:3000/todos

# List todos
curl http://localhost:3000/todos

# Get config
curl http://localhost:3000/config
```

## ▶️ Next Module

Continue to [Module 06: Middleware](../module-06-middleware)
