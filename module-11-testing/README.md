# Module 11: Testing

Learn to test Axum applications effectively.

## 🎯 What You'll Learn

- Unit testing handlers
- Integration testing with `oneshot`
- Creating mock state
- Testing JSON responses
- Asserting status codes

## 🚀 Running Tests

```bash
# Run all tests
cargo test

# Run with output
cargo test -- --nocapture
```

## 🧪 Test Results

```
running 4 tests
test tests::test_health_check ... ok
test tests::test_create_user ... ok
test tests::test_get_user_not_found ... ok
test tests::test_list_users ... ok

test result: ok. 4 passed; 0 failed
```

## 💡 Testing Patterns

### Basic Handler Test
```rust
#[tokio::test]
async fn test_health() {
    let app = create_app(test_store());
    
    let response = app
        .oneshot(Request::builder().uri("/health").body(Body::empty()).unwrap())
        .await
        .unwrap();
    
    assert_eq!(response.status(), StatusCode::OK);
}
```

### Testing with JSON Body
```rust
#[tokio::test]
async fn test_create_user() {
    let app = create_app(test_store());
    
    let response = app
        .oneshot(
            Request::builder()
                .method("POST")
                .uri("/users")
                .header("content-type", "application/json")
                .body(Body::from(r#"{"name":"Alice"}"#))
                .unwrap(),
        )
        .await
        .unwrap();
    
    assert_eq!(response.status(), StatusCode::CREATED);
}
```

### Reading Response Body
```rust
let body = response.into_body().collect().await.unwrap().to_bytes();
let user: User = serde_json::from_slice(&body).unwrap();
assert_eq!(user.name, "Alice");
```

### Mock State
```rust
fn test_store() -> UserStore {
    Arc::new(RwLock::new(HashMap::new()))
}

// Pre-populate for specific tests
store.write().unwrap().insert(1, User { id: 1, name: "Bob".into() });
```

## ▶️ Next Module

Continue to [Module 12: Production](../module-12-production)
