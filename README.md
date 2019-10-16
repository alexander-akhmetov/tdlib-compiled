# tdlib binaries

[tdlib](https://github.com/tdlib/td) binaries for MacOS and Linux (libc/musl)

## How to build

To build linux versions run `build.sh` with a specified version: `./build.sh linux` or `./build.sh linux-musl`.
When compilation process is done, compiled `libtdjson.so` will be in the `linux/compiled/` (or `linux-musl`) directory.

The tdlib version is hardcoded, so if you want to build another version, you need to change `tdlib_tag` it in the script.

### Alpine & 1.5.0

There is no 1.5.0 build for Alpine at the moment: https://github.com/tdlib/td/pull/716
