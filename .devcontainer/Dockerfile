# Imagem base com Java 21 (OpenJDK) e Maven pré-instalados
FROM mcr.microsoft.com/devcontainers/base:trixie

# Atualização de pacotes e instalação do Graphviz, Gnuplot e GCC/G++ em um único layer
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get upgrade -y \
    && apt-get -y install --no-install-recommends \
        build-essential \
        graphviz \
        gnuplot \
        g++ \
        cmake \
        cppcheck \
        valgrind \
        gdb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
