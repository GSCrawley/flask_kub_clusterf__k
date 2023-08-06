FROM python:3.6-slim

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    nginx \
    python3-dev \
    build-essential

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt --src /usr/local/src

COPY flaskapi.py /app/flaskapi.py
COPY flaskapi-config.py /app/flaskapi-config.py
COPY uwsgi.ini /app/wsgi.ini
COPY startup.sh /app/startup.sh

RUN chmod +x ./startup.sh

EXPOSE 80
CMD [ "./startup.sh" ]