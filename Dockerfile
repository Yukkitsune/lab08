FROM ubuntu:latest

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . /solver
WORKDIR /solver/solver_application
RUN rm -rf _build
RUN cmake -H. -B _build
RUN cmake --build _build

ENV LOG_PATH /home/logs/log.txt

VOLUME /home/logs

ENTRYPOINT ["sh", "-c", "echo '1\n2\n3\n' | ./_build/equasion >> /home/logs/log.txt"]
