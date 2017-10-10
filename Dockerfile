FROM bucharestgold/rhel-base

USER root
RUN mkdir -p /usr/src/node-rpm
WORKDIR /usr/src/node-rpm/

COPY src/nodejs.spec src/run.sh /usr/src/node-rpm/
COPY src/nodejs.spec /root/rpmbuild/SPECS/

COPY src/patches/0001-System-CA-Certificates.patch     \
     src/nodejs_native.attr /root/rpmbuild/SOURCES/

CMD ["./run.sh"]
