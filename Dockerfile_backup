FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -y --no-install-recommends apt-utils \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip


# RUN pip3 install --default-timeout=100 gunicorn

# RUN apt-get install -y libjpeg-dev zlib1g-dev libmysqlclient-dev
ADD requirements.txt /requirements.txt
# ADD requirements_server.txt /requirements_server.txt
RUN pip3 install --default-timeout=100 -i https://pypi.douban.com/simple -r requirements.txt

ADD . /hg_backend
WORKDIR /hg_backend

# ADD docker/supervisord.conf /etc/supervisord.conf
# RUN python3 ./manage.py runserver 8001
# CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
RUN python3 ./manage.py migrate
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8001"]
EXPOSE 8001
