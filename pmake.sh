#! /bin/bash

function helpmsg() {
	echo "pmake <language> <project_name>"
	echo "Available languages are:"
	echo "1. clang    C"
	echo "2. cpp      C++"
	echo "3. hsk      Haskell"
	echo "4. glang    Golang"
}

function createtree() {
	case $1 in
		clang)
				if [ -d ~/.config/pmake/C ]
				then
					cp -r ~/.config/pmake/C $2
				else
					mkdir ~/.config/pmake/C
					createtree $1 $2
				fi
			;;
		cpp)
				if [ -d ~/.config/pmake/Cpp ]
				then
					cp -r ~/.config/pmake/Cpp $2
				else
					mkdir ~/.config/pmake/Cpp
					createtree $1 $2
				fi
			;;
		hsk)
				if [ -d ~/.config/pmake/Haskell ]
				then
					cp -r ~/.config/pmake/Haskell $2
				else
					mkdir ~/.config/pmake/Haskell
					createtree $1 $2
				fi
			;;
		glang)
				if [ -d ~/.config/pmake/Golang ]
				then
					cp -r ~/.config/pmake/Golang $2
				else
					mkdir ~/.config/pmake/Golang
					createtree $1 $2
				fi
			;;
		*)
			helpmsg
			;;
	esac
}

function main() {
	if [ -d ~/.config/pmake ]
	then
		createtree $1 $2
	else
		mkdir ~/.config/pmake
		main $1 $2
	fi
}

if [ -z "$1" ] || [ -z "$2" ]
then
	helpmsg
else
	main $1 $2
fi
