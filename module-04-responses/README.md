# Module 04: Response Types

Master different response types and the IntoResponse trait.

## 🎯 What You'll Learn

- String and JSON responses
- HTML responses
- Custom headers and status codes
- Redirects
- Implementing `IntoResponse`
- API wrapper patterns

## 🚀 Running

```bash
cargo run
```

## 📝 Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/string` | Static string |
| GET | `/json/user` | JSON object |
| GET | `/json/users` | JSON array |
| GET | `/html` | Beautiful HTML page |
| GET | `/headers` | Custom headers |
| GET | `/redirect/permanent` | 301 redirect |
| GET | `/custom` | Custom IntoResponse |
| GET | `/api/success` | API wrapper success |
| GET | `/api/error` | API wrapper error |

## 💡 Response Types

### Simple Responses
```rust
async fn text() -> &'static str { "Hello" }
async fn json() -> Json<User> { Json(user) }
async fn html() -> Html<String> { Html("<h1>Hi</h1>".into()) }
```

### With Status Codes
```rust
async fn created() -> (StatusCode, Json<User>) {
    (StatusCode::CREATED, Json(user))
}
```

### Custom IntoResponse
```rust
impl IntoResponse for ApiResponse<T> {
    fn into_response(self) -> Response {
        (self.status(), Json(self)).into_response()
    }
}
```

## 🧪 Try It

```bash
# JSON response
curl http://localhost:3000/json/user

# HTML page (open in browser)
open http://localhost:3000/html

# Check custom headers
curl -v http://localhost:3000/headers
```

## ▶️ Next Module

Continue to [Module 05: State Management](../module-05-state)
