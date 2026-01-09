# Module 03: Extractors

Learn to extract data from requests with Axum's powerful extractor system.

## 🎯 What You'll Learn

- Built-in extractors (Path, Query, Json, Headers)
- **No `#[async_trait]` needed** (Axum 0.8+)
- Custom extractors
- Extractor ordering rules
- Validation patterns

## 🚀 Running

```bash
cargo run
```

## 📝 Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/users/{id}` | Path extractor |
| GET | `/users?page=1` | Query extractor |
| POST | `/users` | Json body extractor |
| GET | `/headers` | Headers extractor |
| GET | `/protected` | Custom API key extractor |
| POST | `/validated` | Validated JSON body |

## 💡 Key Changes in Axum 0.8

### No More `#[async_trait]`!

```rust
// OLD (pre-0.8)
#[async_trait]
impl<S> FromRequestParts<S> for MyExtractor { ... }

// NEW (0.8+) - Native async traits!
impl<S> FromRequestParts<S> for MyExtractor {
    fn from_request_parts(...) -> impl Future<Output = ...> + Send {
        async move { ... }
    }
}
```

## 🧪 Try It

```bash
# Path extractor
curl http://localhost:3000/users/123

# Query extractor
curl "http://localhost:3000/users?page=2&limit=10"

# JSON body
curl -X POST -H "Content-Type: application/json" \
     -d '{"name":"John","email":"john@example.com"}' \
     http://localhost:3000/users

# Custom API key extractor
curl -H "X-API-Key: secret123" http://localhost:3000/protected
```

## ⚠️ Important: Extractor Order

Body-consuming extractors must come **LAST** in handler parameters!

```rust
async fn handler(
    Path(id): Path<u64>,      // OK - first
    Query(q): Query<Params>,  // OK - second
    Json(body): Json<Data>,   // MUST be last!
) { }
```

## ▶️ Next Module

Continue to [Module 04: Responses](../module-04-responses)
