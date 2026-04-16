#!/bin/bash

# Usage: ./create-c-project.sh my_c_project

set -e

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
    echo "Uso: $0 <nome-projeto>"
    exit 1
fi

echo "Criando projeto C '$PROJECT_NAME'..."

# Cria estrutura do projeto
mkdir -p "$PROJECT_NAME"/{src,include,build,tests}
cd "$PROJECT_NAME"

# Cria main.cpp
cat > src/main.c <<EOF
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main() {
    printf("Olá do projeto %s!\n", "$PROJECT_NAME");
    return 0;
}
EOF

# Cria CMakeLists.txt
cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.14)
project($PROJECT_NAME)

set(CMAKE_C_STANDARD 17)

# Ajusta source e include
include_directories(include)
add_executable(\${PROJECT_NAME} src/main.c)
EOF

# Opcional: Adiciona README e .gitignore
echo "# $PROJECT_NAME" > README.md
echo -e "build/\n*.o\n*.exe\n*.out\n" > .gitignore

echo "Projeto C '$PROJECT_NAME' criado com sucesso!"
echo "Para compilar:"
echo "   cd build"
echo "   cmake .."
echo "   make"
echo "   ./\$PROJECT_NAME"
