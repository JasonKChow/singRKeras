Bootstrap: docker
From: ubuntu:16.04
IncludeCmd: yes


%environment
  R_VERSION=3.4.3
  export R_VERSION
  R_CONFIG_DIR=/etc/R/
  export R_CONFIG_DIR

%labels
  Author Jason Chow
  Version v0.01
  Forked https://github.com/remyd1/ubuntu-r-base

%apprun R
  exec R "$@"

%apprun Rscript
  exec Rscript "$@"

%runscript
  exec R "$@"

%files
  libcudnn7_7.3.0.29-1+cuda9.0_amd64.deb ~/libcudnn7_7.3.0.29-1+cuda9.0_amd64.deb

%post
  # R and Keras base things
  apt-get update
  apt-get install -y software-properties-common
  add-apt-repository "deb http://cloud.r-project.org/bin/linux/ubuntu xenial/"
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
  apt-get update
  apt-get install -y \
	r-base \
	locales \
	language-pack-en \
	libpython2.7 \
	python-pip \
	python-virtualenv \
  wget

  # Cuda support
  apt-get install -y linux-headers-$(uname -r)
  wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
  dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
  apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
  apt-get update
  apt-get install -y cuda-9-0

  # install keras
  echo install.packages\(\"keras\"\, repos\=\'https://cloud.r-project.org/\'\) | R --slave
  echo keras::install_keras\(\) | R --slave
