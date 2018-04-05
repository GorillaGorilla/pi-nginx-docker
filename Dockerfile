FROM alexellis2/node4.x-arm
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install libraspberrypi-bin -y
RUN usermod -a -G video root
RUN node -v

#ADD node_modules ./node_modules
COPY index.js ./index.js
COPY index.html ./index.html
RUN mkdir stream
ADD package.json ./package.json
RUN npm install
EXPOSE 3050

CMD ["node", "index.js"]
