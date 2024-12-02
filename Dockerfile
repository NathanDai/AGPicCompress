FROM python:3.6.15-buster

# 设置工作目录
WORKDIR /app

RUN pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/

RUN sed -i s/deb.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list
RUN sed -i s/security.debian.org/mirrors.aliyun.com/g /etc/apt/sources.list

RUN apt update
RUN apt install pngquant -y

COPY . /app

RUN ls /app && pip install -r requirements.txt
