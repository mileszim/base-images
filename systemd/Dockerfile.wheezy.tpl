FROM #{FROM}

# Install Systemd

RUN echo "deb http://ftp.debian.org/debian/ wheezy-backports main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update && apt-get --target-release wheezy-backports install -y systemd \
    && rm -rf /var/lib/apt/lists/*

ENV container lxc

# We never want these to run in a container
RUN systemctl mask \
    dev-hugepages.mount \
    dev-mqueue.mount \
    sys-fs-fuse-connections.mount \
    sys-kernel-config.mount \
    sys-kernel-debug.mount \

    display-manager.service \
    getty@.service \
    systemd-logind.service \
    systemd-remount-fs.service \

    getty.target \
    graphical.target  

COPY entry.sh /usr/bin/entry.sh    
COPY launch.service /etc/systemd/system/launch.service

RUN systemctl enable /etc/systemd/system/launch.service

ENTRYPOINT ["/usr/bin/entry.sh"]