# Boost

```
cd ext/sources
wget https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.tar.gz
tar xf boost_1_81_0.tar.gz
cd boost_1_81_0

./bootstrap.sh --prefix=/home/billd/git/MakeCraft/ext/boost
./b2
./b2 stage
./b2 install
```
