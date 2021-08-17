#  Base Image
FROM --platform=linux/amd64 python:rc-alpine3.14

# Install tools
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

# Make a workdir and copy application to that
RUN mkdir /app
WORKDIR /app
COPY . /app

# Install packages
RUN pip3 install -r requirements.txt

# Expose port
EXPOSE 8000

# Running with gunicorn
ENTRYPOINT [ "gunicorn", "-w", "4", "--bind=0.0.0.0:8000", "application.wsgi" ]