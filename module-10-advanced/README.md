# Module 10: Advanced Features

WebSockets, SSE, file uploads, and static files.

## 🎯 What You'll Learn

- WebSocket real-time communication
- Server-Sent Events (SSE)
- Multipart file uploads
- Static file serving

## 🚀 Running

```bash
cargo run
```

Then open http://localhost:3000 in your browser for the interactive demo!

## 📝 Endpoints

| Type | Path | Description |
|------|------|-------------|
| GET | `/` | Interactive demo page |
| WS | `/ws` | WebSocket echo |
| GET | `/sse` | Server-Sent Events stream |
| POST | `/upload` | File upload |
| GET | `/static/*` | Static files |

## 💡 Feature Examples

### WebSocket
```rust
async fn ws_handler(ws: WebSocketUpgrade) -> impl IntoResponse {
    ws.on_upgrade(handle_socket)
}

async fn handle_socket(mut socket: WebSocket) {
    while let Some(msg) = socket.recv().await {
        if let Ok(Message::Text(text)) = msg {
            socket.send(Message::Text(format!("Echo: {}", text))).await;
        }
    }
}
```

### Server-Sent Events
```rust
async fn sse_handler() -> Sse<impl Stream<Item = Result<Event, Infallible>>> {
    let stream = stream::repeat_with(|| {
        Event::default().data("Server time: ...")
    })
    .throttle(Duration::from_secs(1));
    
    Sse::new(stream).keep_alive(KeepAlive::default())
}
```

### File Upload (Multipart)
```rust
async fn upload(mut multipart: Multipart) -> String {
    while let Some(field) = multipart.next_field().await.unwrap() {
        let name = field.name().unwrap_or("unknown");
        let data = field.bytes().await.unwrap();
        println!("Received file: {} ({} bytes)", name, data.len());
    }
    "Upload complete"
}
```

## 🧪 Try It

The best way to test is to open http://localhost:3000 in your browser!

For command-line testing:

```bash
# File upload
curl -X POST -F "file=@README.md" http://localhost:3000/upload

# SSE (streams events)
curl http://localhost:3000/sse

# WebSocket (use wscat)
wscat -c ws://localhost:3000/ws
```

## ▶️ Next Module

Continue to [Module 11: Testing](../module-11-testing)
