#!/bin/bash
set -e

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install wasm-bindgen
cargo install wasm-bindgen-cli

# Install wasm-snip fork
cargo install --git https://github.com/r58Playz/wasm-snip

# Install wasm-opt (no root needed)
BINARYEN_VERSION=version_123
curl -L https://github.com/WebAssembly/binaryen/releases/download/${BINARYEN_VERSION}/binaryen-${BINARYEN_VERSION}-x86_64-linux.tar.gz | tar xz
export PATH="$PWD/binaryen-${BINARYEN_VERSION}/bin:$PATH"

# Build
pnpm i
pnpm --filter @mercuryworkshop/scramjet run rewriter:build
pnpm build
