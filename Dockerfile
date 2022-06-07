FROM python:3.19-slim-bullseye

RUN pip awscli==1.23.9 twine==4.0.0

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
