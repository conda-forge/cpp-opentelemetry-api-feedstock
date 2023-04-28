@echo on

mkdir build-cpp
if errorlevel 1 exit 1

cd build-cpp
cmake .. ^
      -GNinja ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_CXX_STANDARD=17 ^
      -DCMAKE_PREFIX_PATH=%CONDA_PREFIX% ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DBUILD_TESTING=OFF ^
      -DOPENTELEMETRY_INSTALL=ON ^
      -DWITH_API_ONLY=ON ^
      -DWITH_ETW=OFF ^
      -DWITH_EXAMPLES=OFF

cmake --build . --config Release --target install
if errorlevel 1 exit 1

:: ensure we don't clobber CMake files from cpp-opentelemetry-sdk
rmdir /s /q %LIBRARY_LIB%\cmake\opentelemetry-cpp
