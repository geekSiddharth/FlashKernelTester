FROM ubuntu:16.04
MAINTAINER Siddharth Yadav

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -yf build-essential qemu-system-x86 qemu-system-arm \
                                        qemu-kvm \
                                        make \
                                        gcc \
                                        unzip \
                                        wget \ 
                                        qemu \
                                        virt-manager \
					git
RUN apt-get install -y virt-viewer libvirt-bin \
                                        libelf-dev \ 
                                        chrpath \
                                        gawk \
                                        texinfo \
                                        libsdl1.2-dev \
                                        whiptail \
                                        diffstat \
                                        cpio \
                                        libssl-dev \
                                        bc

  
RUN apt-get install -y nano \
			minicom


RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /shared
VOLUME ["/shared"] 
WORKDIR /shared

RUN git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

# RUN IMG=qemu-image.img && \
# 	DIR=mount-point.dir && \
# 	qemu-img create $IMG 1g && \
# 	mkfs.ext2 $IMG && \
# 	mkdir $DIR && \
# 	mount -o loop $IMG $DIR && \
# 	debootstrap  --arch amd64 trusty $DIR http://archive.ubuntu.com/ubuntu/ && \
# 	umount $DIR && \
# 	rmdir $DIR \

