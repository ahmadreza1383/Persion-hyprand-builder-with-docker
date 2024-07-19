FROM focker.ir/debian

# Copy init files
COPY ./etc/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources
COPY ./etc/resolv.conf /etc/resolv.conf
COPY ./entrypoint.sh /entrypoint.sh
# Copy cache files
COPY ./cache/apt/ /var/cache/apt/archives/

# Set workdir
RUN mkdir /build
WORKDIR /build

# Install and update packages
RUN echo "Update packages and installing initial packages: "
RUN apt install apt-transport-https -y; \
    apt update -y; \
    apt upgrade -y; \
    apt install curl git build-essential wget libssl-dev ninja-build pkg-config libgl1-mesa-dev -y

# Install dependencies of HyprLand
RUN apt install libxkbcommon-dev uuid-dev libgbm-dev libudev-dev libcairo2-dev python3-dev libpango1.0-dev libseat-dev hwdata librust-wayland-cursor-dev wayland-protocols libdrm-dev libinput -y

# Definition entrypoint
RUN chmod 777 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]



