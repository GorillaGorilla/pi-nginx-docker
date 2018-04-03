FROM alexellis2/node4.x-arm

RUN apt-get -y update && \
    apt-get install -qy nginx

#ADD node_modules ./node_modules
COPY index.js ./index.js
COPY index.html ./index.html
RUN mkdir stream
ADD package.json ./package.json
RUN npm install
#RUN ["nginx", "-g", "daemon off;"]
WORKDIR /etc/nginx
RUN rm nginx.conf
ADD default.config nginx.conf
EXPOSE 80
WORKDIR /root/
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
