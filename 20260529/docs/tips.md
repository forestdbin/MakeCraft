## Compiler

```bash
sudo apt-get install build-essential
```

```bash
sudo apt-get install clang llvm
```

```bash
sudo apt-get install crossbuild-essential-arm64
sudo apt-get install qemu-user-static
QEMU_LD_PREFIX=/usr/aarch64-linux-gnu/ qemu-aarch64-static ./hello
QEMU_LD_PREFIX=/usr/aarch64-linux-gnu/ LD_TRACE_LOADED_OBJECTS=1 ./hello
```


## Coverage

```bash
sudo apt-get install lcov
```

```bash
sudo apt-get install gcovr
```


## Linter

```bash
sudo apt-get install clang-tidy
sudo apt-get install clang-format
sudo apt-get install clang-tools
```


## Formatter
```bash
sudo apt-get install indent
sudo apt-get install astyle
```
