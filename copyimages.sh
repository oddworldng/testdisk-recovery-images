#!/bin/bash


mkdir -p img
for fname in $(find . -name '*' -exec file {} \; | grep -o -P '^.+: \w+ image' | cut -d: -f1-1)
do
	if [ -f "$fname" ]; then
    		echo "WARNING: El fichero $fname existe y se cambiara de nombre..."
		cutfname=$(echo $fname | cut -d/ -f3)
		cp $fname img/$(date +%s%N)"_"$cutfname
	else
		echo "Copiado el fichero $fname."
		cp $fname img
	fi
done
