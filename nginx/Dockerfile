FROM nginx
RUN apt update && \
    apt install curl netcat -y

RUN mkdir /opt/nginx \
          /health

ADD bin/ /opt/nginx/
ADD conf/ /etc/nginx/conf.d/

WORKDIR /opt/nginx/
RUN chmod 744 ./run.sh

HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://localhost/health || exit 1

CMD ["./run.sh", "jenkins2", "8080"]
