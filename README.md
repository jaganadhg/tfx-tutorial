# Tensorflow Extended (TFX) Tutorial
Introduction 
https://youtu.be/38nU3iutsu0 

## Base Software Installation
For this tutorial we need Anaconda Python and Docker installed on your machine. You can find the anaconda software and installations at https://www.anaconda.com/distribution/. For Docker CE installation refer the document at https://docs.docker.com/install/linux/docker-ce/ubuntu/. 

OS : Ubuntu 16.06 LTS

### Set-up TFX Python environment

To set-up, TFX Python environment clone this repo and use the install.sh file in the setup directory. 
This script will install a conda environment with name "tfx_test", and installs tensorfloe2.0 beta and required software packages. It installs the key dependency Apache Airflow and initialises the AirflowDB.
