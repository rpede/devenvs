set positional-arguments

@add env:
  touch $1.Dockerfile
  touch $1.env.sh
  sh addenv.sh $1
build-dotnet:
  cat base.Dockerfile dotnet.Dockerfile user.Dockerfile > Dockerfile
  docker build -t devenv/dotnet -q .
run-dotnet: build-dotnet
  docker run -it -t devenv/dotnet
build-node:
  cat base.Dockerfile node.Dockerfile user.Dockerfile > Dockerfile
  docker build -t devenv/node -q .
run-node: build-node
  docker run -it -t devenv/node
