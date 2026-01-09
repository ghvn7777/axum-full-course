# Module 08: Database Integration

Connect Axum to PostgreSQL with SQLx.

## 🎯 What You'll Learn

- SQLx connection pooling
- CRUD operations
- Query macros
- Database migrations
- Error handling with SQLx

## ⚠️ Prerequisites

**PostgreSQL required!** Start with Docker:

```bash
docker run -d --name postgres \
  -e POSTGRES_PASSWORD=postgres \
  -e POSTGRES_DB=axum_course \
  -p 5432:5432 \
  postgres:16
```

Or use docker-compose from project root:
```bash
docker-compose up -d postgres
```

## 🚀 Running

```bash
# Set database URL
export DATABASE_URL=postgres://postgres:postgres@localhost/axum_course

cargo run
```

## 📝 CRUD Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/users` | List all users |
| POST | `/users` | Create user |
| GET | `/users/{id}` | Get user by ID |
| PUT | `/users/{id}` | Update user |
| DELETE | `/users/{id}` | Delete user |

## 💡 SQLx Patterns

### Connection Pool
```rust
let pool = PgPoolOptions::new()
    .max_connections(5)
    .connect(&database_url)
    .await?;

Router::new().with_state(pool)
```

### Query with FromRow
```rust
#[derive(sqlx::FromRow)]
struct User { id: Uuid, name: String }

let users = sqlx::query_as::<_, User>("SELECT * FROM users")
    .fetch_all(&pool)
    .await?;
```

### Insert & Return
```rust
let user = sqlx::query_as::<_, User>(
    "INSERT INTO users (id, name) VALUES ($1, $2) RETURNING *"
)
.bind(Uuid::new_v4())
.bind(&input.name)
.fetch_one(&pool)
.await?;
```

## 🧪 Try It

```bash
# Create user
curl -X POST -H "Content-Type: application/json" \
     -d '{"name":"Alice","email":"alice@example.com"}' \
     http://localhost:3000/users

# List users
curl http://localhost:3000/users
```

## ▶️ Next Module

Continue to [Module 09: Authentication](../module-09-auth)
