apptainer run --nv \
--bind /tmp/.X11-unix:/tmp/.X11-unix \
--bind /home/jovyan/.Xauthority:/home/developer/.Xauthority \
--bind /home/jovyan/DeepLabCut/deeplabcut/pose_estimation_tensorflow/models/pretrained:/usr/local/lib/python3.10/dist-packages/deeplabcut/pose_estimation_tensorflow/models/pretrained \
--bind /opt/conda/lib \
docker://catalystneuro/dlc_dandi:gui-0.1.0