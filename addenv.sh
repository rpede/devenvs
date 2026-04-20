echo """
build-$1:
  cat base.Dockerfile $1.Dockerfile user.Dockerfile > Dockerfile
  docker build -t devenv/$1 -q .
run-$1: build-$1
  docker run -it -t devenv/$1
""" >>justfile
