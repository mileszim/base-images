# AUTOGENERATED FILE
FROM resin/generic-aarch64-node:7.10.1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN DEBIAN_FRONTEND=noninteractive JOBS=MAX npm install --unsafe-perm
ONBUILD COPY . /usr/src/app

CMD [ "npm", "start" ]
