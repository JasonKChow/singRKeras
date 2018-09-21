# ubuntu-r-base

A singularity recipe to build R for the use with Keras. Requires
[cuDNN v7.3.0 Runtime Library for Ubuntu16.04 (Deb)](https://developer.nvidia.com/rdp/cudnn-download) in the build directory.

To build (requires root):
```
cd ~/singRKeras
sudo singularity build RKeras.simg Singularity
```

To run script:
```
cd ~/singRKeras
singularity exec RKeras.simg Rscript testScript.R
```

To run R interactively:
```
cd ~/singRKeras
singularity exec RKeras.simg R
```
