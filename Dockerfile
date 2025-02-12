FROM ubuntu:22.04

RUN apt-get update -qq && apt-get install -y python3-pip
RUN pip install jupyter-collaboration
RUN pip install jupyterlab

ARG USERNAME=jupyter
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create a non-root user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # Add sudo support for the non-root user
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    curl \
    software-properties-common

RUN mkdir -p /home/$USERNAME/jupyter \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME

WORKDIR /home/$USERNAME/jupyter

EXPOSE 8888

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]