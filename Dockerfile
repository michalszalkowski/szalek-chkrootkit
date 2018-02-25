FROM ubuntu:16.04

MAINTAINER szalek <szalek@btbw.pl>

# -------------------------------------

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y net-tools && \
    apt-get install -y ssh && \
    apt-get install -y build-essential && \
    apt-get install -y wget
#    apt-get install -y chkrootkit


RUN wget -c ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit.tar.gz && \
    wget -c ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit.md5 && \
    md5sum -c chkrootkit.md5 && \
    tar xzvf chkrootkit.tar.gz && \
    cd chkrootkit* && \
    make sense && \
    ln -s $(pwd)/chkrootkit /usr/bin/chkrootkit

CMD ["chkrootkit","-r","/data/"]