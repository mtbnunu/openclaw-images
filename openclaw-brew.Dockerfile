# Start from your OpenClaw base image
FROM openclaw:local 

# Switch to root to install prerequisites and configure permissions
USER root

# Install the core system tools that Homebrew requires to compile packages
RUN apt-get update && apt-get install -y \
    build-essential \
    procps \
    curl \
    file \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Give the 'node' user passwordless sudo access (required by the Homebrew installer)
RUN echo "node ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN npm install -g clawhub

# Switch back to the 'node' user for the actual installation
USER node

# Run the Homebrew install script non-interactively so it doesn't pause for prompts
RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the system PATH so OpenClaw can find the 'brew' command immediately
ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
