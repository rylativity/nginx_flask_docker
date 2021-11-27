FROM nginx:alpine

COPY ./nginx_conf/proxy.conf /etc/nginx/proxy.conf
COPY ./nginx_conf/nginx.conf /etc/nginx/nginx.conf
COPY ./nginx_conf/default.conf /etc/nginx/conf.d/default.conf

