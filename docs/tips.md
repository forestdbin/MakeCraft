## Compiler

```
sudo apt-get install build-essential
```

```
sudo apt-get install clang llvm
```

```
sudo apt-get install crossbuild-essential-arm64
sudo apt-get install qemu-user-static
QEMU_LD_PREFIX=/usr/aarch64-linux-gnu/ qemu-aarch64-static ./hello
QEMU_LD_PREFIX=/usr/aarch64-linux-gnu/ LD_TRACE_LOADED_OBJECTS=1 ./hello
```


## Coverage

```
sudo apt-get install lcov
```

```
sudo apt-get install gcovr
```


## Linter

```
sudo apt-get install clang-tidy
sudo apt-get install clang-format
sudo apt-get install clang-tools
```


## Formatter
```
sudo apt-get install indent
sudo apt-get install astyle
```
