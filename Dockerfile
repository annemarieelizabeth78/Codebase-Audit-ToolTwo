FROM rust:1.82 AS builder
WORKDIR /app
COPY . .
RUN cargo build --release -p forgecore-cli

FROM debian:bookworm-slim
RUN useradd --system --create-home forgecore
COPY --from=builder /app/target/release/forgecore-cli /usr/local/bin/forgecore
USER forgecore
EXPOSE 8080
CMD ["forgecore", "serve", "--host", "0.0.0.0", "--port", "8080"]
