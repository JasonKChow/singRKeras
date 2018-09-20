Bootstrap: docker
From: ubuntu:16.04
IncludeCmd: yes


%environment
  R_VERSION=3.4.3
  export R_VERSION
  R_CONFIG_DIR=/etc/R/
  export R_CONFIG_DIR

%apprun R
  exec R "$@"

%apprun Rscript
  exec Rscript "$@"

%runscript
  exec R "$@"

%post
  apt-get update
  apt-get install -y software-properties-common
  add-apt-repository "deb http://cloud.r-project.org/bin/linux/ubuntu xenial/"
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
  apt-get update
  apt-get install -y \
	r-base \
	locales \
	language-pack-en

  # install keras
  echo install.packages\(\"keras\"\, repos\=\'https://cloud.r-project.org/\'\) | R --slave
