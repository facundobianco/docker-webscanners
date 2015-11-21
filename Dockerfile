FROM debian:8.2
MAINTAINER Facundo Bianco < vando [at] van [dot] do >

ENV TERM xterm
ENV LD_LIBRARY_PATH /usr/local/lib
ENV PATH $PATH:/usr/local/sbin:/usr/local/bin

ADD http://downloads.sourceforge.net/project/dirb/dirb/2.22/dirb222.tar.gz /usr/local/src/

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libcurl4-gnutls-dev
    
RUN tar -C /usr/local/src -zxf /usr/local/src/dirb222.tar.gz
RUN cd /usr/local/src/dirb222 ; chmod +x configure ; \
    ./configure && make && make install ; \
    mkdir /usr/share/dirb ; cp -r wordlists /usr/share/dirb

CMD ["/bin/bash"]
