# ubuntu-r-base

A singularity recipe to build R for the use with Keras.

To build (requires root):
```
cd ~/singRKeras
sudo singularity build RKeras.simg Singularity
```

To use:
```
cd ~/singRKeras
singularity exec RKeras.simg Rscript testScript.R
```
