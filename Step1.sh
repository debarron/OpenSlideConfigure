# Notes.txt


# Clone Repo 
# 	git clone https://github.com/openslide/openslide-java.git


# Install Dependencies
# 	brew install ant # Install Apache ANT
# 	brew install openslide # Install OpenSlide
# 	brew install autoconf
# 	brew install automake
# 	brew install libtool

# Install Software
# 	autoconf
# 	If error:
# 		> On 2015-11-16 11:33, Tammy Diprima via openslide-users wrote:
# 		>> PROBLEM: when I run automake, I get this error:
# 		>> configure.ac:10 [1]: error: possibly undefined macro: AM_INIT_AUTOMAKE
# 		>>
# 		>> SOLUTION:
# 		>>
# 		>> Install ant, and then:
# 		>>
# 		>> glibtoolize --force
# 		>> aclocal
# 		>> autoheader
# 		>> automake --force-missing --add-missing
# 		>> autoconf
# 		>> Configure looks for jni_md.h.  Locate it and copy it to one of the		
# 		>> locations configure is looking in.		
# 		>> example:		
# 		>> sudo cp		
# 		>> /Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home/include/darwin/jni_md.h		
# 		>> /Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home/include		
# 	./configure
# 	make
# 	make install

# 	java -jar openslide.jar

# Run it in cloudlab

# NEEDS ANT
# Comment line two of /etc/apt/sources.list
# Update the system

echo ">>> Editing the sources.list file" 
sudo sed -i -e '2s/^/#/' /etc/apt/sources.list

echo ">>> Updating the system"
sudo apt-get -y update  

echo ">>> Installing dependencies"
sudo apt-get -y install libjpeg-dev libpng12-dev liblcms2-dev libtiff-dev libpng-dev libz-dev libopenjpeg-dev libopenjpeg5 libopenjpeg5-dbg openjpeg-tools libcairo2-dev libglib2.0-dev libgtk2.0-dev libxml2-dev sqlite3 libsqlite3-dev libopenblas-base openslide-tools pkg-config python-software-properties ant


echo ">>> Updating system variables"
export LD_LIBRARY_PATH=/usr/lib/openblas-base/

echo ">>> Cloning OpenSlide for Java"
git clone https://github.com/openslide/openslide-java.git

echo ">>> Installing OpenSlide for Java"
cd "./openslide-java"
libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf


./configure
make
make install




