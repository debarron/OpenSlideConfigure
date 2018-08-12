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

# Everything's done, make the link to /usr/local
echo ">> Working on: /usr/local/lib/openslide-java/" >> $log_file
echo ">> Creating the link: libopenslide-jni.jnilib -> libopenslide-jni.so" >> $log_file
echo ">> Working on: /usr/local/lib/openslide-java/"
echo ">> Creating the link: libopenslide-jni.jnilib -> libopenslide-jni.so"
ln -s /usr/local/lib/openslide-java/libopenslide-jni.jnilib /usr/local/lib/openslide-java/libopenslide-jni.so

echo ">> Configuration is done " >> $log_file 
echo ">> Configuration is done "
echo ">> More information in $log_file"

