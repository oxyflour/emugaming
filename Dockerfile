FROM alpine
ENV http_proxy 'http://proxy.yff.me:8125'
ENV https_proxy 'http://proxy.yff.me:8125'
RUN apk add qemu-system-x86_64 qemu-img ovmf socat
COPY TU102.rom /
COPY start.sh /
RUN cp /usr/share/OVMF/OVMF_VARS.fd /qemu-win10.nvram
CMD ["/start.sh"]
