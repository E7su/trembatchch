FROM centos:centos6
LABEL maintainer Polina Azarova <etsu4296@gmail.com>

ADD requirements.txt /app/requirements.txt

# install dependencies
RUN yum update -y && yum install -y gcc zlib-devel openssl-devel mysql-devel wget git

# install python3
RUN mkdir /build && cd /build && \
	curl -O https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz && \
	tar xzf Python-3.5.2.tgz && cd Python-3.5.2 && \
	./configure && make && make install && \
	rm -rf /build


# get pip alongside pip3; is this better than a symlink?
RUN pip3 install --upgrade pip && \
    pip3 install -r /app/requirements.txt

ENV TELEGRAM_TOKEN=$TELEGRAM_TOKEN

WORKDIR /app

ENV TELEGRAM_TOKEN=122728217:AAF1UTsSrjYeQr0xt9M6FhNtGy8L0GEUGw0

RUN git clone https://github.com/E7su/trembatchch.git

EXPOSE 5000

CMD ["python3.5", "/app/trembatchch/server.py"]
