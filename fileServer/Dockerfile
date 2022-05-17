FROM golang:1.17-alpine AS build

COPY . /usr/local/go/src/fileServer
WORKDIR /usr/local/go/src/fileServer

RUN CGO_ENABLED=0 go build \
	-installsuffix 'static' \
	-o ./ ./

FROM gcr.io/distroless/static AS final

LABEL maintainer="yunhui"

COPY --from=build /usr/local/go/src/fileServer/web/* build/
COPY --from=build /usr/local/go/src/fileServer/fileServer app

EXPOSE 80

ENTRYPOINT ["./app"]
