# Module 02: Routing Deep Dive

Master Axum's routing system with the new 0.8 syntax.

## 🎯 What You'll Learn

- **New path syntax**: `/{id}` instead of `/:id`
- Wildcard routes with `/{*rest}`
- Query parameters
- Router nesting and merging
- HTTP method routing

## 🚀 Running

```bash
cargo run
```

## 📝 Endpoints

### HTTP Methods Demo
| Method | Path | Description |
|--------|------|-------------|
| GET | `/resource` | Read all resources |
| POST | `/resource` | Create new resource |
| GET | `/resource/{id}` | Read single resource |
| PUT | `/resource/{id}` | Full update |
| PATCH | `/resource/{id}` | Partial update |
| DELETE | `/resource/{id}` | Remove resource |

### Path Parameters & Nesting
| Method | Path | Description |
|--------|------|-------------|
| GET | `/users/{id}/posts/{post_id}` | Multiple path params |
| GET | `/files/{*path}` | Wildcard route |
| GET | `/items?page=1&limit=10` | Query params |
| GET/POST | `/api/v1/users` | Nested routes |
| GET/PUT/PATCH/DELETE | `/api/v1/users/{id}` | Full CRUD |

## 💡 Key Changes in Axum 0.8

### Path Parameters (NEW SYNTAX!)

```rust
// OLD (pre-0.8)
.route("/users/:id", get(handler))

// NEW (0.8+)
.route("/users/{id}", get(handler))
```

### Wildcards (NEW SYNTAX!)

```rust
// OLD: "/*rest"
// NEW:
.route("/files/{*path}", get(files))
```

## 🧪 Try It

```bash
# Path parameters
curl http://localhost:3000/users/123/posts/456

# Query parameters
curl "http://localhost:3000/items?page=2&limit=20"

# Nested routes
curl http://localhost:3000/api/v1/users
```

## ▶️ Next Module

Continue to [Module 03: Extractors](../module-03-extractors)
