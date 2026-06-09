# nlohmann json

```bash
cd ext/sources
git clone https://github.com/nlohmann/json.git
cd json
git checkout -b v3.12.0 v3.12.0

cmake -S . -B out -DCMAKE_INSTALL_PREFIX=../../../ext/json -DJSON_BuildTests=OFF -DJSON_MultipleHeaders=OFF
cmake --build out -t install
```
