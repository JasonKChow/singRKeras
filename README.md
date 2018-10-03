# ubuntu-r-base

A singularity recipe to build R for the use with Keras. Requires cuDNN for CUDA 9.0, rename to libcudnn.deb:
[cuDNN v7.3.0 Runtime Library for Ubuntu16.04 (Deb)](https://developer.nvidia.com/rdp/cudnn-download) in the build directory.

Requires CUDA 9.0, rename to cuda.deb. [CUDA Toolkit 9.0](https://developer.nvidia.com/cuda-90-download-archive?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=deblocal) in the build directory.

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
