FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DLClight=False
ENV DISPLAY=unix:1.0

RUN apt-get update -yy \ 
    && apt-get install -yy --no-install-recommends python3 python3-pip python3-dev ffmpeg libsm6 libxext6 \
    && apt-get install -yy --no-install-recommends build-essential make cmake gcc g++ \
    && apt-get install -yy --no-install-recommends libgtk-3-dev python3-wxgtk4.0 locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8 en_GB.UTF-8

RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install numpy tensorflow decorator==4.4.2 \
    && pip3 install deeplabcut[gui] \
    && pip cache purge

# Create the application directory and set its permissions.
ENV GID=100
ENV GNAME=users
ENV UID=1000
ENV UNAME=jovyan
RUN mkdir -p /home \
    && mkdir -p /app \
    && groupadd -g ${GID} ${GNAME} || groupmod -o -g ${GID} ${GNAME} \
    && useradd -d /home -s /bin/bash -u ${UID} -g ${GID} ${UNAME} \
    && chown -R ${UNAME}:${GNAME} /home \
    && chown -R ${UNAME}:${GNAME} /app

ENV TF_CPP_MIN_LOG_LEVEL="2"
RUN apt update -y \ 
    && apt install libxkbcommon-x11-0 libxcb-icccm4 libxcb-ima* libxcb-keys* libxcb-ran* libxcb-render-ut* -y

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-11.7/compat

WORKDIR /app

CMD ["python3", "-m", "deeplabcut"]