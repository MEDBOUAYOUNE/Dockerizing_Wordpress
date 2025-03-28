FROM	debian:12
RUN	apt-get update && apt-get install -y nginx && apt-get install -y openssl
	
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/mbouayou.crt \
    -keyout /etc/nginx/ssl/mbouayou.key \
    -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mbouayou.42.fr/UID=mbouayou"

COPY	/conf/default /etc/nginx/sites-enabled/default
RUN chown -R root:root /var/www/html
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]