# docker-checkbashisms - a Docker container for checkbashisms

# EXAMPLE

```console
$ make
docker build -t mcandre/docker-checkbashisms

docker run --rm -v $(pwd):/src mcandre/docker-checkbashisms /src/lib/script.sh
possible bashism in /src/lib/script.sh line 3 (alternative test command ([[ foo ]] should be [ foo ])):
[[ -r "$HOME/.bashrc" ]] && echo "~/.bashrc is readable"
```

# DOCKER HUB

https://registry.hub.docker.com/u/mcandre/docker-checkbashisms/

# REQUIREMENTS

* [Docker](https://www.docker.com/)

## Optional

* [make](http://www.gnu.org/software/make/)
* [editorconfig-cli](https://github.com/amyboyd/editorconfig-cli) (e.g. `go get github.com/amyboyd/editorconfig-cli`)
* [flcl](https://github.com/mcandre/flcl) (e.g. `go get github.com/mcandre/flcl/...`)
