# nlohmann json

```
cd ext/sources
git clone https://github.com/nlohmann/json.git
cd json
git checkout -b v3.11.3 v3.11.3

cmake -S . -B out -DCMAKE_INSTALL_PREFIX=~/git/MakeCraft/ext/json -DJSON_BuildTests=OFF -DJSON_MultipleHeaders=OFF
cmake --build out -t install
```
