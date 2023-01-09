# Run DeepLabCut GUI on DANDI Hub

1. Choose a GPU instance, and move to your working directory.

2. Create a `deeplabcut.def` file like the one above.

3. In a terminal, run (this will create a `deeplabcut.sif` file):
```bash
singularity build deeplabcut.sif deeplabcut.def 
```

4. Open a Desktop view. Within the Desktop view, open a terminal and run:
```bash
singularity run --nv --bind /tmp/.X11-unix:/tmp/.X11-unix --bind /home/jovyan/.Xauthority:/home/developer/.Xauthority --bind $(pwd):/app  deeplabcut.sif
```

The GUI should open in a few seconds.


## Troubleshoot

- For long running processes, the Desktop view in DANDI hub might lock the screen. To avoid this: https://github.com/dandi/dandi-hub/issues/44#issuecomment-1369105088

- If getting `OSError: [Errno 30] Read-only file system: '/usr/local/lib/python3.8/dist-packages/deeplabcut/pose_estimation_tensorflow/models/pretrained/resnet_v1_152.ckpt`: https://github.com/DeepLabCut/DeepLabCut/issues/1828#issuecomment-1124867766 


# Run DeepLabCut Jupyter examples on DANDI Hub

Create a conda environment and add it to Jupyter kernels:
```bash
# Activate bash command line
$ bash

# Create new conda env for DLC
$ git clone https://github.com/DeepLabCut/DeepLabCut.git
$ cd DeepLabCut/conda-environments
$ conda env create -f DEEPLABCUT.yaml

# Install ipykernel and add env_dlc to Jupyter
$ conda install -c anaconda ipykernel
$ python -m ipykernel install --user --name=env_dlc
```