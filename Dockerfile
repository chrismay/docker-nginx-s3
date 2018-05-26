FROM coopernurse/nginx-s3-proxy
RUN apt-get update && apt-get install -y apache2-utils sed
ADD nginx.conf /nginx.conf
ADD run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/bin/bash", "-c", "/run.sh"]