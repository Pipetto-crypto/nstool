#!/bin/bash
ARG1=$1
help(){

echo -e "build.sh [compile-all|compile]"
echo -e "\nOptions:\n"
echo -e "compile-all          Compile all dependencies before compiling nstool"
echo -e "compile              Compile nstool using prebuilt dependencies, recommended for Termux users"


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
	cp staticlibs/libfmt.a deps/libfmt/bin
	cp staticlibs/libmbedtls.a deps/libmbedtls/bin
	cp staticlibs/libtoolchain.a deps/libtoolchain/bin
	cp staticlibs/libpietendo.a deps/libpietendo/bin
	make

else
	help
fi
