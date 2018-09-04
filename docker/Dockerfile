FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.5
RUN apt-get update

RUN apt-get install -y build-essential python3.5 python3.5-dev python3-pip python3.5-venv
RUN apt-get install -y git

# update pip
RUN python3.5 -m pip install pip --upgrade
RUN python3.5 -m pip install wheel


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
CMD ["python3", "manage.py", "runserver", "8001"]
EXPOSE 8001
