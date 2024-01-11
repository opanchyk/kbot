APP=$(shell basename $(shell git remote get-url origin ))
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short  HEAD)
TARGETOS=linux
TARGETARCH=arm

format:
	gofmt -s -w ./

lint:
	golint

test: 
	go test -v

get:
	go get

build: format get
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X="github.com/OlePan/kbot/cmd.appVesion=${VERSION}

image: 
	docker build -t . ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

push:
	docker push ${REGISTR}/${APP}:${VERSION}-${TARGETARCH}

clean:
	rm -rf kbot

