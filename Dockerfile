FROM python:3.6-slim

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    nginx \
    python3-dev \
    build-essential

COPY nginx.conf /etc/nginx/nginx.com

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt --src /usr/local/src

COPY app.py /app/app.py
COPY config.py /app/config.py
COPY uwsgi.ini /app/wsgi.ini
COPY startup.sh /app/startup.sh

RUN chmod +x ./startup.sh

EXPOSE 80
CMD [ "./startup.sh" ]