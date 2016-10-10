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



sudo apt-get install libjpeg-dev libpng12-dev
sudo apt-get install liblcms2-dev  libtiff-dev libpng-dev libz-dev
sudo apt-get install libopenjpeg-dev libopenjpeg5 libopenjpeg5-dbg openjpeg-tools
sudo apt-get install libcairo2-dev
sudo apt-get install libglib2.0-dev
sudo apt-get install libgtk2.0-dev
sudo apt-get install libxml2-dev
sudo apt-get install sqlite3 libsqlite3-dev
sudo apt-get install libopenblas-base

sudo apt-get install openslide-tools # Install openslide
sudo apt-get install pkg-config

export LD_LIBRARY_PATH=/usr/lib/openblas-base/

