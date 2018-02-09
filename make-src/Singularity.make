Bootstrap: docker
From: ubuntu:16.04
IncludeCmd: yes


%environment
  R_VERSION=3.4.3
  export R_VERSION
  R_CONFIG_DIR=/etc/R/
  export R_CONFIG_DIR

%labels
  Author Jimmy Lopez
  Version v0.0.1
  R_Version 3.4.3
  build_date 2018 Feb 09

%apprun R
  exec R "$@"

%apprun Rscript
  exec Rscript "$@"

%runscript
  exec R "$@"


%post
  apt-get install -y wget
  cd $HOME
  wget https://cran.rstudio.com/src/base/R-3/R-3.4.3.tar.gz
  tar xvf R-3.4.3.tar.gz
  cd R-3.4.3

  apt-get update
  apt-get install -y libblas3 libblas-dev liblapack-dev liblapack3 curl

  apt-get install -y gcc fort77 aptitude
  aptitude install -y g++
  aptitude install -y xorg-dev
  aptitude install -y libreadline-dev
  aptitude install -y gfortran
  gfortran --version
  apt install -y libssl-dev libxml2-dev libpcre3-dev liblzma-dev libbz2-dev libcurl4-openssl-dev

  apt-get update

  ./configure --enable-R-static-lib --with-blas --with-lapack --enable-R-shlib=yes 
  make
  make install
  R --version 
  
  # installing some packages
  echo install.packages\(\"devtools\"\, repos\=\'https://cloud.r-project.org\'\) | R --slave

  echo install.packages\(\"ade4\"\, repos\=\'https://cloud.r-project.org\'\) | R --slave

  echo install.packages\(\"ape\"\, repos\=\'https://cloud.r-project.org/\'\) | R --slave

  echo install.packages\(\"FD\"\, repos\=\'https://cloud.r-project.org/\'\) | R --slave

  R --slave "devtools::install_github('igraph/rigraph')"

  R --slave -e "source('https://bioconductor.org/biocLite.R'); \
  biocLite()"

  R --slave -e "source('https://bioconductor.org/biocLite.R'); \
  biocLite('dada2')"

  R --slave -e "source('https://bioconductor.org/biocLite.R'); \
  biocLite('phyloseq')"




