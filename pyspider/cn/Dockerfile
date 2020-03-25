FROM python:3.6.8-alpine3.8
MAINTAINER sayue <sayue2019@qq.com>

# 替换阿里云的源
RUN echo "http://mirrors.aliyun.com/alpine/v3.8/main/" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/v3.8/community/" >> /etc/apk/repositories

ENV LANG en_US.UTF-8

# install base
RUN apk update && apk upgrade && apk add --no-cache --virtual .build-deps \
    curl-dev \
    libressl-dev \
    gcc \
    libc-dev \
    libxslt-dev \
    python3-dev \
    musl-dev \
    postgresql-dev

# install phantomjs
ENV PHANTOMJS_VERSION 2.1.1

RUN mkdir -p /opt/phantomjs && apk add --update --no-cache tar curl ca-certificates libxslt ttf-dejavu fontconfig && \
    cd /opt/phantomjs && \
    curl -Ls "https://github.com/dustinblackman/phantomized/releases/download/${PHANTOMJS_VERSION}/dockerized-phantomjs.tar.gz" | tar xz -C / && \ 
    curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2  | tar -jxvf - -C ./ && \
    cp phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
    rm -fR phantomjs-${PHANTOMJS_VERSION}-linux-x86_64

# install requirements
COPY requirements.txt /opt/pyspider/requirements.txt
RUN pip install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com \
    && pip install -r /opt/pyspider/requirements.txt -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com \
    && apk del --no-cache .build-deps

# add all repo
ADD ./ /opt/pyspider

# run test
WORKDIR /opt/pyspider
RUN pip install -e .[all] \
    && rm phantomjs-*.bz2


#VOLUME ["/opt/pyspider"]
ENTRYPOINT ["pyspider"]

EXPOSE 5000 23333 24444 25555
