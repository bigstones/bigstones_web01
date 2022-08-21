FROM python:3.8.13-alpine3.16

WORKDIR /
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY ./app /app
WORKDIR /app

COPY entrypoint.sh /app/entrypoint.sh
ENTRYPOINT [ "sh", "entrypoint.sh" ]