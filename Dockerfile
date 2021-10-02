FROM python:3.9-slim

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN python -m venv /ve

ENV PATH="/ve/bin:$PATH"

RUN apt-get update -y && \
    apt-get upgrade -y && \
    /ve/bin/pip install --upgrade pip && \
    /ve/bin/pip install -r /requirements.txt

COPY ./app /app

WORKDIR /app

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
