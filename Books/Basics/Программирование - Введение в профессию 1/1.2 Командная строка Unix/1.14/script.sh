#!/bin/sh

if [ $# -gt 1 ]; then
	echo "Ошибка: Необходимо передать не более одного аргумента"
	exit 1
fi

DIR=$1
CUR=($(pwd))

mkdir $DIR

if [ $? -gt 0 ]; then
	echo "Ошибка: Указан неверный путь, либо каталог уже создан"
	exit 2
fi

files=($(ls -p | grep -v / | grep -v "^$DIR"))

for ((i = 0; i < ${#files[@]}; i++)); do
	link_name="$DIR/file$((i+1))"
	file="${CUR}/${files[i]}"
	ln -s "$file" "$link_name"
done