FROM resin/armv7hf-fedora-buildpack-deps:26-curl

RUN dnf install -y  \
		bzr \
		git \
		mercurial \
		openssh-clients \
		subversion \
	&& dnf clean all
