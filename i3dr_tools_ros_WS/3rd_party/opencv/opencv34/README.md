## OpenCV 3.4.6

### Build

```bash
mkdir build
cd build
cmake \
-D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_CUDA=OFF \
-D WITH_EIGEN=ON \
-D EIGEN_INCLUDE_PATH=/usr/local/include/eigen3 \
-D ENABLE_FAST_MATH=0 \
-D CUDA_FAST_MATH=0 \
-D WITH_CUBLAS=1 \
-D INSTALL_C_EXAMPLES=OFF \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D OPENCV_EXTRA_MODULES_PATH=/home/i3dr/i3dr_tools_ros/i3dr_tools_ros_WS/3rd_party/opencv/opencv34/opencv_contrib/modules  \
-D BUILD_SHARED_LIBS=ON \
-D WITH_GTK=ON \
-D BUILD_EXAMPLES=ON CMAKE_C_COMPILER=/usr/bin/gcc-5 \
-D ENABLE_CXX11=ON ..
make -j4
make install
sudo make install
```
