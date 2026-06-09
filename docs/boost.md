# Boost

```bash
cd ext/sources
wget https://archives.boost.io/release/1.91.0/source/boost_1_91_0.tar.bz2
tar xf boost_1_91_0.tar.bz2
cd boost_1_91_0

./bootstrap.sh --prefix=../../../ext/boost
./b2
./b2 stage
./b2 install
```
