#!/bin/bash

set -euxo pipefail

# cd into the directory where this script lives.
# This allows us to run this script from the root project directory,
# which is what Netlify wants to do.
SCRIPT_RELATIVE_DIR=$(dirname "${BASH_SOURCE[0]}")
cd $SCRIPT_RELATIVE_DIR

rm -rf build/
cp -r public/ build/

pushd ..
echo 'Generating docs...'
cargo --version
rustc --version
# We run the CLI with --no-default-features because that way we don't have the
# "llvm" feature and therefore don't depend on LLVM being installed on the
# system. (Netlify's build servers have Rust installed, but not LLVM.)
#
# We set RUSTFLAGS to -Awarnings to ignore warnings during this build,
# because when building without "the" llvm feature (which is only ever done
# for this exact use case), the result is lots of "unused" warnings!
RUSTFLAGS=-Awarnings cargo run -p roc_cli --no-default-features docs compiler/builtins/docs/Bool.roc
RUSTFLAGS=-Awarnings cargo run -p roc_cli --no-default-features docs compiler/builtins/docs/Str.roc
mv generated-docs/ www/build/builtins
popd
