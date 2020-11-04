# Use a fedora OS
FROM fedora:31

ENV USER=nepthys \
    PIPENV_CACHE_DIR=/home/user/.cache/pipenv \
    HOME=/home/user/ \
    LANG=en_US.UTF-8 \
    GITHUB_COMMIT=1

# Set the working directory
WORKDIR /home/user

# Copy the script from current directory contents into the container
COPY docker_entrypoint.sh .
COPY create_docs.sh .
COPY _templates /home/user/_templates

# Add the ssh key from local dir to container dir.
#COPY id_rsa /home/user/.ssh/id_rsa

# Install any needed packages
RUN \
    dnf install -y --setopt=tsflags=nodocs hub python36 python3-pip gcc redhat-rpm-config python3-devel which graphviz &&\
    pip3 install pipenv &&\
    mkdir -p /home/user/.ssh &&\
    chmod a+wrx -R /etc/passwd /home/user

# Run script when the container launches, docker-entrypoint script let user access the container system
ENTRYPOINT ["./docker_entrypoint.sh"]
CMD ["./create_docs.sh"]
