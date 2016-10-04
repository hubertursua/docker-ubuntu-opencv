# INSTALL THE LIBRARY (YOU CAN CHANGE $CV_VERSION FOR THE LAST STABLE VERSION)
CV_VERSION="2.4.13"

# Download OpenCV
apt-get install -y unzip wget
wget https://github.com/Itseez/opencv/archive/$CV_VERSION.zip
unzip $CV_VERSION.zip
rm $CV_VERSION.zip
mv opencv-$CV_VERSION opencv
cd opencv
CV_ROOT=`pwd`

# Make build directory and ensure it is clean
mkdir build
cd build
rm -rf *

# Build and install
cmake -DWITH_QT=ON -DWITH_OPENGL=ON -DFORCE_VTK=ON -DWITH_TBB=ON -DWITH_GDAL=ON -DWITH_XINE=ON -DBUILD_EXAMPLES=ON -DCMAKE_INSTALL_PREFIX=$CV_ROOT ..
make -j4
make install
ldconfig