# Build Image and publish to Dockerhub

```bash
# Build image
$ DOCKER_BUILDKIT=1 docker build -t catalystneuro/dlc_dandi:gui-0.1.0 .

# Publish image
$ docker push catalystneuro/dlc_dandi:gui-0.1.0
```

# Run DeepLabCut GUI on DANDI Hub

1. Choose a GPU instance, and move to your working directory.

2. Create or copy the file `run_dlc_gui.sh`

3. Open a Desktop view. Within the Desktop view, open a terminal and run:
```bash
bash run_dlc_gui.sh
```

The first time you run it migth take a few minutes to complete. In any future runs the GUI should open in a few seconds.


## Troubleshoot

- For long running processes, the Desktop view in DANDI hub might lock the screen. To avoid this: https://github.com/dandi/dandi-hub/issues/44#issuecomment-1369105088

- If getting `OSError: [Errno 30] Read-only file system: '/usr/local/lib/python3.8/dist-packages/deeplabcut/pose_estimation_tensorflow/models/pretrained/resnet_v1_152.ckpt`: https://github.com/DeepLabCut/DeepLabCut/issues/1828#issuecomment-1124867766 


# Run DeepLabCut Jupyter examples on DANDI Hub - TODO

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

# References

- [DLC models overview](https://www.youtube.com/watch?v=ILsuC4icBU0&ab_channel=DeepLabCut)