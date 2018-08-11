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


install_log_file=$(mktemp)
log_file="LOCAL_LOG.log"
echo ">> Running the OpenSlide Local Configuration $(date)"
echo ">> Running the OpenSlide Local Configuration $(date)" >> $log_file

# Comment line two of /etc/apt/sources.list
# And, update the system repository
echo ">>> Editing the sources.list file, Running: sudo sed -i -e '2s/^/#/' /etc/apt/sources.list"
echo ">>> Editing the sources.list file, Running: sudo sed -i -e '2s/^/#/' /etc/apt/sources.list" >> $log_file
sudo sed -i -e '2s/^/#/' /etc/apt/sources.list

echo ">>> Updating the system, Running: sudo apt-get -y update"
echo ">>> Updating the system, Running: sudo apt-get -y update" >> $log_file
sudo apt-get -y update &> $install_log_file
cat $install_log_file >> $log_file


# Install all the dependencies,
# Check for errors in log_file
dependencies="libjpeg-dev libpng12-dev liblcms2-dev libtiff-dev libpng-dev libz-dev libopenjpeg-dev libopenjpeg5 libopenjpeg5-dbg openjpeg-tools libcairo2-dev libglib2.0-dev libgtk2.0-dev libxml2-dev sqlite3 libsqlite3-dev libopenblas-base openslide-tools pkg-config python-software-properties ant"

for d in $dependencies
do
  echo ">> Installing: $d" 
  echo ">> Installing: $d" >> $log_file

  sudo apt-get -y install $d &> $install_log_file 
  cat $install_log_file >> $log_file
  echo " " >> $log_file
done


# Configure OpenSlide, hands on!
echo " "
echo ">> Installing OpenSlide library "
echo " " >> $log_file
echo ">> Installing OpenSlide library " >> $log_file

export LD_LIBRARY_PATH=/usr/lib/openblas-base/
openslide_repos="openslide openslide-java"

for repo in $openslide_repos
do
  repo_ulr="https://github.com/openslide/$repo.git"

  echo ">> Repo: $repo_ulr"
  echo ">> Repo: $repo_ulr" >> $log_file
  git clone $repo_ulr &> $install_log_file
  cat $install_log_file >> $log_file

  cd $repo
  libtoolize --force && aclocal && autoheader &> $install_log_file  
  cat $install_log_file >> $log_file 

  automake --force-missing --add-missing &> $install_log_file 
  cat $install_log_file >> $log_file

  autoconf && ./configure && make && sudo make install &> $install_log_file
  cat $install_log_file >> $log_file

  cd ..
done

echo ">> Configuration is done " >> $log_file 
echo ">> Configuration is done "
echo ">> More information in $log_file"

