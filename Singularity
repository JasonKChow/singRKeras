Bootstrap: docker
From: ubuntu:16.04
IncludeCmd: yes


%environment
  R_VERSION=3.4.3
  export R_VERSION
  R_CONFIG_DIR=/etc/R/
  export R_CONFIG_DIR
  CUDA_HOME=/usr/local/cuda
  export CUDA_HOME
  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64
  export LD_LIBRARY_PATH
  PATH=${CUDA_HOME}/bin:${PATH}
  export PATH

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
  libcudnn.deb
  cuda.deb

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
  dpkg -i cuda.deb
  apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
  apt-get update
  apt-get install -y cuda

  # cudnn
  dpkg -i libcudnn.deb
  apt-get update
  apt-get install -y libcupti-dev

  # install keras
  echo install.packages\(\"keras\"\, repos\=\'https://cloud.r-project.org/\'\) | R --slave
  echo keras::install_keras\(tensorflow \= \"gpu\"\) | R --slave

  # Start nvidia cuda mps server
  nvidia-cuda-mps-server

  # ACCRE binding points
  mkdir /scratch /data /gpfs22 /gpfs23
