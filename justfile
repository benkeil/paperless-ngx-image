set positional-arguments
set ignore-comments

imagename := "benkeil/paperless-ngx-image"
current_branch := `git current-branch`

build:
  docker build -t {{imagename}}:latest .

docker-login:
  echo $GITHUB_TOKEN | docker login ghcr.io -u benkeil --password-stdin

publish: docker-login
  docker tag {{imagename}} ghcr.io/{{imagename}}:latest
  docker push ghcr.io/{{imagename}}:{{ current_branch }}

default:
  just --list
