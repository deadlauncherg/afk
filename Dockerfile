FROM quay.io/jupyter/base-notebook:latest

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git curl wget unzip nano zip ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER ${NB_UID}
WORKDIR /home/jovyan

CMD ["sh", "-c", "exec start-notebook.py --ServerApp.ip=0.0.0.0 --ServerApp.port=${PORT:-8080} --ServerApp.allow_remote_access=True --ServerApp.root_dir=/home/jovyan/work"]
