#!/bin/bash
set -e

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install wasm-bindgen
cargo install wasm-bindgen-cli

# Install wasm-snip fork
cargo install --git https://github.com/r58Playz/wasm-snip

# Install wasm-opt (Binaryen)
apt-get install -y binaryen

# Now follow the docs exactly
pnpm i
pnpm rewriter:build
pnpm build
