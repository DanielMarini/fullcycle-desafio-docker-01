FROM golang:1.15 as builder

LABEL version="1.0"
LABEL description="FullCycle 3.0 - Módulo Docker - Desafio 01 - Daniel Marini \
 1) Criar uma imagem com menos de 2mb \
 2) Ao executar, deverá ser executado um programa em GO \
 3) O programa deve exibir o texto Code.education Rocks!"


RUN mkdir -p /app
WORKDIR /app

COPY app/app.go .

RUN GOOS=linux go build -ldflags="-w -s" ./app.go

##################################################
FROM scratch

WORKDIR /app
COPY --from=builder /app/app .
CMD ["/app/app"]