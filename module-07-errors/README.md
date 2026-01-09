# Module 07: Error Handling

Learn proper error handling patterns in Axum.

## 🎯 What You'll Learn

- Custom error types with `thiserror`
- Implementing `IntoResponse` for errors
- Result-based handlers
- Error recovery patterns
- JSON error responses

## 🚀 Running

```bash
cargo run
```

## 📝 Endpoints

| Method | Path | Response |
|--------|------|----------|
| GET | `/users/1` | 200 - User found |
| GET | `/users/999` | 404 - Not found |
| GET | `/validate/ab` | 400 - Too short |
| GET | `/protected` | 401 - Unauthorized |
| GET | `/database` | 500 - DB error |

## 💡 Error Handling Patterns

### Custom Error Type
```rust
#[derive(Error, Debug)]
enum AppError {
    #[error("User not found: {0}")]
    UserNotFound(u64),
    
    #[error("Invalid input: {0}")]
    InvalidInput(String),
}
```

### IntoResponse for Errors
```rust
impl IntoResponse for AppError {
    fn into_response(self) -> Response {
        let (status, message) = match &self {
            AppError::UserNotFound(_) => (StatusCode::NOT_FOUND, self.to_string()),
            AppError::InvalidInput(_) => (StatusCode::BAD_REQUEST, self.to_string()),
        };
        (status, Json(ErrorResponse { error: message })).into_response()
    }
}
```

### Result Handlers
```rust
async fn get_user(Path(id): Path<u64>) -> Result<Json<User>, AppError> {
    find_user(id)?  // Uses ? operator
}
```

## 🧪 Try It

```bash
# Success
curl http://localhost:3000/users/1

# 404 Not Found
curl http://localhost:3000/users/999

# 400 Bad Request
curl http://localhost:3000/validate/ab

# 401 Unauthorized
curl http://localhost:3000/protected
```

## ▶️ Next Module

Continue to [Module 08: Database](../module-08-database)
