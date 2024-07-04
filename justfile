set positional-arguments
set ignore-comments

imagename := "benkeil/paperless-ngx-image"

build:
  docker build -t {{imagename}}:latest .

docker-login:
  echo $GITHUB_TOKEN | docker login ghcr.io -u benkeil --password-stdin

publish: docker-login
  docker tag {{imagename}} ghcr.io/{{imagename}}:latest
  docker push ghcr.io/{{imagename}}:latest

default:
  just --list
