FROM ubuntu:22.04

RUN apt update && \
    apt install -y qemu-system-x86 qemu-utils bridge-utils iproute2 && \
    apt clean

COPY fortigate.qcow2 /opt/fortigate.qcow2
