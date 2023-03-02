#!/bin/bash
ARG1=$1
help(){

echo -e "build.sh [compile-all|compile]"
echo -e "\nOptions:\n"
echo -e "compile-all          Compile all dependencies before compiling nstool"
echo -e "compile              Compile nstool using prebuilt dependencies, recommended for Termux users"
echo -e "clean                Clean the repo"

}

if [ "$ARG1" == "compile-all" ]
then
	git submodule init
	git submodule update
	make deps
	make

elif [ "$ARG1" == "compile" ]
then
	git submodule init
	git submodule update
	mkdir -p deps/libfmt/bin
	mkdir -p deps/libmbedtls/bin
	mkdir -p deps/libtoolchain/bin
	mkdir -p deps/libpietendo/bin
	cp src/staticlibs/libfmt.a deps/libfmt/bin
	cp src/staticlibs/libmbedtls.a deps/libmbedtls/bin
	cp src/staticlibs/libtoolchain.a deps/libtoolchain/bin
	cp src/staticlibs/libpietendo.a deps/libpietendo/bin
	make

elif [ "$ARG1" == "clean" ]
then
	make clean
	make clean_deps
else
	help
fi
