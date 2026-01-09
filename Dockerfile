FROM rust:1.78-slim as builder
WORKDIR /app
COPY . .
RUN cargo build --release -p module-12-production

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
COPY --from=builder /app/target/release/module-12-production /usr/local/bin/app
EXPOSE 3000
CMD ["app"]
