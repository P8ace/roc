# Roc installation guide for x86_64 macOS systems

## How to install Roc

In order to develop in Roc, you need to install the Roc CLI,
which includes the Roc compiler and various helpful utilities.

1. Download the latest nightly from the assets [here](https://github.com/roc-lang/roc/releases).

1. To prevent "roc can't be opened because Apple can't check it...":

    ```sh
    xattr -d com.apple.quarantine roc_nightly-macos_x86_64-<VERSION>.tar.gz
    ```

1. Untar the archive:

    ```sh
    mkdir roc_nightly-macos_x86_64-<VERSION>
    tar xf roc_nightly-macos_x86_64-<VERSION>.tar.gz --directory roc_nightly-macos_x86_64-<VERSION>
    cd roc_night<TAB TO AUTOCOMPLETE>
    ```

## How to install Roc platform dependencies

In order to compile Roc apps (either in `examples/` or in your own projects),
you need to install one or more of these platform language compilers, too.

1. Install the Rust compiler, for apps with Rust-based platforms:

    ```sh
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ```

1. Install the Zig compiler, for apps with Zig-based platforms:

    ```sh
    brew install zig
    ```

1. Run examples:

    ```sh
    # Note: If you installed rust in this terminal session, you'll need to open a new one first!
    ./roc examples/platform-switching/rocLovesRust.roc

    ./roc examples/platform-switching/rocLovesZig.roc

    ./roc examples/platform-switching/rocLovesC.roc
    ```
