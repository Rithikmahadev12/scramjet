#!/bin/bash
set -e

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install nightly + rust-src (required by rewriter)
rustup toolchain install nightly
rustup component add rust-src --toolchain nightly

# Install wasm-bindgen (pinned version)
cargo install wasm-bindgen-cli --version 0.2.105 --force

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
