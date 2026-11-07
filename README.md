# ForgeCore

ForgeCore is an extensible software intelligence service for inspecting repositories,
tracking analysis jobs, and exposing results through an HTTP API. This repository
contains the initial working foundation; it is intended to grow through real,
reviewable engineering work.

## Current capabilities

- Rust workspace with a reusable library and command-line application
- Repository inventory and source-file discovery
- Basic source metrics (file count, byte count, line count, extension counts)
- Asynchronous HTTP API with health and analysis endpoints
- Structured errors, request models, and unit tests

## Quick start

```bash
cargo test --workspace
cargo run -p forgecore-cli -- inspect .
cargo run -p forgecore-cli -- serve --host 127.0.0.1 --port 8080
```

Then visit `http://127.0.0.1:8080/health`.

## API

- `GET /health` — service health
- `POST /v1/analysis` — inspect a local directory

Example:

```bash
curl -X POST http://127.0.0.1:8080/v1/analysis \
  -H 'content-type: application/json' \
  -d '{"root":"."}'
```

## Development

Run formatting and lint checks before opening a pull request:

```bash
cargo fmt --all -- --check
cargo clippy --workspace --all-targets -- -D warnings
cargo test --workspace
```

## Roadmap

See [ROADMAP.md](ROADMAP.md) for proposed milestones. Features should be implemented
with tests, documentation, and backward-compatibility considerations.

## Project integrity

ForgeCore is a starter codebase, not a pre-qualified repository. Assessment thresholds
for private ownership, code volume, commits, merged pull requests, contributor history,
development duration, and test coverage must be met through genuine project work.
