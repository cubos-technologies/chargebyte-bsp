FROM debian:11

# Install dependencies for yocto
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    chrpath \
    cpio \
    debianutils \
    diffstat \
    file \
    gawk \
    gcc \
    git \
    iputils-ping \
    libacl1 \
    libc6-dev \
    liblz4-tool \
    locales \
    python3 \
    python3-git \
    python3-jinja2 \
    python3-pexpect \
    python3-pip \
    python3-subunit \
    socat \
    sudo \
    texinfo \
    unzip \
    wget \
    xz-utils \
    zstd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set default locale to en_US.UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

# Set up a non-root user
ARG USER_NAME=yocto
ARG HOST_UID=1000
ARG HOST_GID=$HOST_UID

# Create the user and its group
RUN groupadd --gid $HOST_GID $USER_NAME && \
    useradd --gid $HOST_GID --uid $HOST_UID --shell /bin/bash --create-home $USER_NAME && \
    usermod -aG sudo $USER_NAME && \
    echo "$USER_NAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install dependencies for repo
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y --no-install-recommends \
    curl \
    gnupg \
    less \
    ssh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER $USER_NAME

# Install repo
RUN mkdir -p ~/.bin && \
    PATH="$HOME/.bin:$PATH" && \
    echo 'export PATH="$HOME/.bin:$PATH"' >> ~/.bashrc && \
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.bin/repo && \
    chmod a+rx ~/.bin/repo

