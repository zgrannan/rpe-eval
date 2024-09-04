FROM rust:latest

# For debugging, some useful tools
RUN apt-get update && apt-get install -y vim

# Install Java
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# COPY ./workspace/prusti-dev-orig /workspace/prusti-dev-orig

# WORKDIR /workspace/prusti-dev-orig

# RUN ./x.py setup

# RUN ./x.py build --all

COPY ./workspace/prusti-dev /workspace/prusti-dev

WORKDIR /workspace/prusti-dev

RUN ./x.py setup

COPY ./workspace/symbolic-execution /workspace/symbolic-execution
COPY ./workspace/pcs /workspace/pcs

# RUN ./x.py build --all

COPY ./container-files/run-eval.sh /workspace/run-eval.sh

WORKDIR /workspace
