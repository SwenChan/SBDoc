FROM node:6-alpine
MAINTAINER SwenChan

WORKDIR /app/SBDoc
COPY . .
RUN echo http://mirrors.aliyun.com/alpine/v3.4/main/ > /etc/apk/repositories && \
	echo http://mirrors.aliyun.com/alpine/v3.4/community/ >> /etc/apk/repositories && \
	apk update && \
	apk add --no-cache --virtual build-libs python make g++
RUN cd SBDoc && npm i --build-from-source --registry=https://registry.npm.taobao.org \
		      --disturl=https://npm.taobao.org/mirrors/node \
		      --production && \
		      cd ../SBDocClient && \
		      npm i --build-from-source --registry=https://registry.npm.taobao.org \
		      --disturl=https://npm.taobao.org/mirrors/node \
		      --production && \
		      npm cache clean && cd /app/SBDoc
RUN apk del build-libs
CMD ["sh","./start.sh"]
EXPOSE 10000

