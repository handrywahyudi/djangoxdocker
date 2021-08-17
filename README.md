## How to build the image
docker build . -t django-blog:0.1.0

## How to run the container
docker run -d --name django-blog -p 8000:8000 django-blog:0.1.0