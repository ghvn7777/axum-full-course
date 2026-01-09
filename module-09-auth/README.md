# Module 09: Authentication & Authorization

Implement JWT authentication in Axum.

## 🎯 What You'll Learn

- JWT token creation & validation
- Password hashing with Argon2
- Auth middleware
- Protected routes
- Role-based access control

## 🚀 Running

```bash
cargo run
```

## 📝 Endpoints

| Method | Path | Description |
|--------|------|-------------|
| POST | `/register` | Register new user |
| POST | `/login` | Login & get JWT |
| GET | `/protected/me` | Get current user (auth required) |
| GET | `/protected/admin` | Admin only (auth required) |

## 💡 Auth Patterns

### Password Hashing
```rust
use argon2::{Argon2, PasswordHasher};

fn hash_password(password: &str) -> String {
    let salt = SaltString::generate(&mut OsRng);
    Argon2::default()
        .hash_password(password.as_bytes(), &salt)
        .unwrap()
        .to_string()
}
```

### JWT Creation
```rust
let claims = Claims {
    sub: user_id,
    exp: expiry_timestamp,
    role: "user".to_string(),
};

let token = encode(&Header::default(), &claims, &EncodingKey::from_secret(secret))?;
```

### Auth Middleware
```rust
async fn auth_middleware(request: Request, next: Next) -> Result<Response, StatusCode> {
    let token = extract_bearer_token(&request)?;
    let claims = verify_token(token)?;
    
    request.extensions_mut().insert(CurrentUser::from(claims));
    Ok(next.run(request).await)
}
```

## 🧪 Try It

```bash
# Login (test credentials)
curl -X POST -H "Content-Type: application/json" \
     -d '{"email":"test@example.com","password":"password123"}' \
     http://localhost:3000/login

# Use the returned token
TOKEN="eyJ..."

# Access protected route
curl -H "Authorization: Bearer $TOKEN" \
     http://localhost:3000/protected/me
```

## 🔑 Test Credentials

- Email: `test@example.com`
- Password: `password123`

## ▶️ Next Module

Continue to [Module 10: Advanced Features](../module-10-advanced)
