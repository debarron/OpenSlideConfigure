# author: @debarron
# 08/12/2018
#
# RUN IT AS: ./local_install
# 
# The following script configures OpenSlide on a local machine.
# Previous to install and configure OpenSlide, we need a set of
# dependencies, which the script installs individually.
# 
# After all dependencies are installed, it downloads two repos: 
# + https://github.com/openslide/openslide.git 
# + https://github.com/openslide/openslide-java.git
# 
# You can check the LOCAL_LOG.log file and check if everythin 
# has been taken care of correctly.

# java -jar openslide.jar
# Run it in cloudlab


# 1 Install dependencies
sudo sed -i -e '2s/^/#/' /etc/apt/sources.list &> /dev/null
sudo apt-get update &> /dev/null
sudo apt-get install --yes libjpeg-dev &> /dev/null
sudo apt-get install --yes libpng12-dev &> /dev/null
sudo apt-get install --yes liblcms2-dev &> /dev/null
sudo apt-get install --yes libtiff-dev &> /dev/null
sudo apt-get install --yes libpng-dev &> /dev/null
sudo apt-get install --yes libz-dev &> /dev/null
sudo apt-get install --yes libopenjpeg-dev &> /dev/null
sudo apt-get install --yes libopenjpeg5 &> /dev/null
sudo apt-get install --yes libopenjpeg5-dbg &> /dev/null
sudo apt-get install --yes openjpeg-tools &> /dev/null
sudo apt-get install --yes libcairo2-dev &> /dev/null
sudo apt-get install --yes libglib2.0-dev &> /dev/null
sudo apt-get install --yes libgtk2.0-dev &> /dev/null
sudo apt-get install --yes libxml2-dev &> /dev/null
sudo apt-get install --yes sqlite3 &> /dev/null
sudo apt-get install --yes libsqlite3-dev &> /dev/null
sudo apt-get install --yes libopenblas-base &> /dev/null
sudo apt-get install --yes openslide-tools &> /dev/null
sudo apt-get install --yes pkg-config &> /dev/null
sudo apt-get install --yes python-software-properties &> /dev/null 
sudo apt-get install --yes ant &> /dev/null

export JAVA_HOME='/usr/lib/jvm/default-java'

openslide_prefix="$HOME/openslide-dep"
rm -Rf "$openslide_prefix"
mkdir "$openslide_prefix"

# 2 Install openslide
git clone "https://github.com/openslide/openslide.git" "$openslide_prefix/openslide"
cd "$openslide_prefix/openslide"
libtoolize --force && aclocal && autoheader &> /dev/null
automake --force-missing --add-missing &> /dev/null 
autoconf && ./configure && make && sudo make install &> /dev/null


# 3 Install openslide-java
git clone "https://github.com/openslide/openslide-java.git" "$openslide_prefix/openslide-java"
cd "$openslide_prefix/openslide-java"
libtoolize --force && aclocal && autoheader &> /dev/null
automake --force-missing --add-missing &> /dev/null 
autoconf && ./configure && make && sudo make install &> /dev/null

# 4 Fix the link issue
sudo ln -s /usr/local/lib/openslide-java/libopenslide-jni.so /usr/local/lib/openslide-java/libopenslide-jni.jnilib 

# 5 Create a reference to use in nidan-wsi-core
echo "export OPENSLIDE_JAVA='/usr/local/lib/openslide-java'" >> ~/.bashrc

