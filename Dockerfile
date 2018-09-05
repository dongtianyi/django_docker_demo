FROM python:3
 ENV PYTHONUNBUFFERED 1

ADD requirements.txt /requirements.txt
# ADD requirements_server.txt /requirements_server.txt
RUN pip3 install --default-timeout=100 -i https://pypi.douban.com/simple -r requirements.txt

ADD . /hg_backend
WORKDIR /hg_backend

# ADD docker/supervisord.conf /etc/supervisord.conf
# RUN python3 ./manage.py runserver 8001
# CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]
RUN python3 ./manage.py migrate
# CMD ["python3", "manage.py", "runserver", "0.0.0.0:8001"]
# EXPOSE 8001