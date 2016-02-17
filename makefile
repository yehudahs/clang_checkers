LLVM_ORIG:=llvm_orig
LLVM_SOURCE_FOLDER=llvm
COMPILER_CHANGES_SOURCES:=llvm_changes
BUILD_FOLDER:=./build
CONFIGURATION := Release
BIN_PREFIX:=/usr

PATH:=/opt/centos/devtoolset-1.1/root/usr/bin/:/auto/app/Python-2.7.9/bin/:$(current_dir):${PATH}
export PATH


all: clang

check_configuration:
	if ! ([[ $(CONFIGURATION) == "Debug" ]] || [[ $(CONFIGURATION) == "Release" ]]); then \
		echo "invlalid input: wrong CONFIGURATION : " $(CONFIGURATION) ; \
		echo ""; \
		echo "Choose between Debug/Release"; \
		exit 1; \
        fi

${LLVM_ORIG}: llvm.orig.tar.gz.aa llvm.orig.tar.gz.ab llvm.orig.tar.gz.ac llvm.orig.tar.gz.ad llvm.orig.tar.gz.ae llvm.orig.tar.gz.af llvm.orig.tar.gz.ag llvm.orig.tar.gz.ah llvm.orig.tar.gz.ai llvm.orig.tar.gz.aj
	if [ ! -d ${LLVM_ORIG} ]; then \
		cat llvm.orig.tar.gz.* > ${LLVM_ORIG}.tar.gz ; \
		tar -zxvf ./llvm_orig.tar.gz ; \
	fi


${LLVM_SOURCE_FOLDER}: ${LLVM_ORIG} ${COMPILER_CHANGES_SOURCES}
	if [ ! -d ${LLVM_SOURCE_FOLDER} ]; then \
		mkdir ${LLVM_SOURCE_FOLDER} ; \
	fi
	rsync -acv ./${LLVM_ORIG}/* ./${LLVM_SOURCE_FOLDER}
	rsync -acv ./${COMPILER_CHANGES_SOURCES}/* ./${LLVM_SOURCE_FOLDER}
	

clang: check_configuration ${LLVM_SOURCE_FOLDER}
	if [ ! -d ${BUILD_FOLDER} ]; then \
		mkdir ${BUILD_FOLDER} ; \
	fi
	(cd ${BUILD_FOLDER} ;cmake -G "Eclipse CDT4 - Unix Makefiles" -DCMAKE_INSTALL_PREFIX=${BIN_PREFIX}  -DCMAKE_BUILD_TYPE=$(CONFIGURATION) -D_ECLIPSE_VERSION=4.5 -DCMAKE_VERBOSE_MAKEFILE=ON ../llvm; ${MAKE} )

install: clang
	(cd build; sudo ${MAKE} install)
	
clean:
	rm -rf ./build ./${LLVM_SOURCE_FOLDER}

