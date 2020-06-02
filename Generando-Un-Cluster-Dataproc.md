# Generando Un Cluster Dataproc 
### Presentación 
Mi nombre es [Bryan-Developer](https://github.com/Bryan-Developer), bueno no es el verdadero pero si quieren saber mas de mi dejare mi informacion de contacto al final del documento. En fin este paper lo estoy preparando para mostrar como desplegar un servicio dataproc enteramente desde la consola y desplegar para analizar una data de manera automatica pero que permita a los consumidores (analista de datos o cientifico de datos etc) explotar los datos.
### Requisitos
1. Una terminal linux.
2. Descargar el google cloud sdk [Google Cloud SDK](https://cloud.google.com/sdk/docs/downloads-versioned-archives?hl=es#installation_instructions)
3. Debi poner esto primero pero una cuenta Google Cloud Platform en Tiempo de prueba.
### Creacion del Cluster
El servicio Dataproc de google ofrece la creacion de cluster hadoop, yarn, spark y hive para la infraestructura de almacenamiento y procesamiento, para el lado del consumo y explotacion de los datos procesados debemos de usar jupyter o zookeeper para dicha tarea.
#### Ejecuta el siguiente comando para desplegar tu cluster dataprocl
```bash
gcloud beta dataproc clusters create cluster-proyecto \
--enable-component-gateway \
--bucket bucket-staging-initial \
--region us-central1 \
--subnet default \
--zone us-central1-a \
--master-machine-type n1-standard-2 \
--master-boot-disk-size 100 \
--num-workers 3 \
--worker-machine-type n1-standard-2 \
--worker-boot-disk-size 600 \
--image-version 1.3-deb9 \
--optional-components ANACONDA,HIVE_WEBHCAT,JUPYTER,ZEPPELIN,DRUID,PRESTO,ZOOKEEPER \
--scopes 'https://www.googleapis.com/auth/cloud-platform' \
--max-idle 600s \
--project bryan-data-engineer \
--initialization-actions 'gs://bucket-start-files/ArchivoInicial.sh'
``` 
### Acciones iniciales 