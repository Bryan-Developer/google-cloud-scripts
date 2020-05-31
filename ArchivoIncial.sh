#!/bin/bash
gsutil cp gs://bucket-start-files/salesdb-final.zip .
unzip salesdb-final.zip
USUARIO=$(whoami)
BASE_DE_DATOS=$(ls -d */)
cd $BASE_DE_DATOS
hdfs dfs -mkdir -p /user/
DIRECTORIOS=$(ls)
DIRECTORIOS=$(echo "${DIRECTORIOS//.csv/}")
DIRECTORIOS=($DIRECTORIOS)
for i in "${DIRECTORIOS[@]}"; do hdfs dfs -mkdir -p /user/$USUARIO/$BASE_DE_DATOS/$i; done
hdfs dfs -ls -R /user/$USUARIO
