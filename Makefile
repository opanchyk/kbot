VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short  HEAD )
format:
	gofmt -s -w ./
build: format 
	CGO_ENABLED=0 GOOS=${TARGETOS} go build -v -o kbot -ldflags "-X="github.com/OlePan/kbot/cmd.appVesion=${VERSION}
