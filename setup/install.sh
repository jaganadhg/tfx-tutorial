#!/usr/bin/bash
<<LICENSE
 Copyright 2019 Jaganadh Gopinadhan

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
LICENSE

<<INTRO
Confugure Tensorflow Extended Environment with Anaconda
Python 3.7 and TF=2.0.
OS : Ubuntu 16.4 LTS

Author : Jaganadh Gopinadhan
e-mail : jaganadhg at outlook dot com
INTRO

#VARS for color

RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`



create_conda_env () {
conda create -n tfx_test python=3.7 anaconda -y

if [$? -eq 0]; then
	echo "${GREEN} Conda environment created ${RESET}"
else
	echo "${RED} Conda environment creation failed ${RESET}"

fi
}


install_tf () {
	echo "${GREEN} Install TF2.x . If GPU available \n GPU version will be installed ${RESET}"
	source activate tfx_test
	if nvidia-smi --list-gpus 2>/dev/null; then
		echo "Found ${GREEN} GPU ${RESET} installing GPU version"
		pip install tensorflow-gpu==2.0.0-beta1
		pip install tensorflow-probability
		echo "${GREEN} Installed tf2.x ${RESET}"
	else
		echo "${GREEN} Installing CPU version TF 2.x ${RESET}"
		pip install tensorflow==2.0.0-beta1
		pip install tensorflow-probability
		echo "${GREEN} Installed tf2.x ${RESET}"
	fi
	conda deactivate
}


install_additional_packages (){
	echo "Install additional Python libraries"
	export SLUGIFY_USES_TEXT_UNIDECODE=yes
	source activate tfx_test
	pip install pydot==1.2.2
	pip install PyYAML --ignore-installed
	pip install tfx
	pip install httplib2==0.12.0
	pip install docker
	pip install papermill
	pip install networkx
	pip install apache-airflow==1.10.3
	pip install Flask==1.0.4
	pip install Werkzeug==0.14.1
	pip install PyYAML --ignore-installed
	pip install tensorflow-model-analysis
	conda deactivate
	echo "Additional Python libraries installed"
}

post_setup () {
	echo "${GREEN}Initializing Airflow database${RESET}\n"
	airflow resetdb --yes
	airflow initdb
	echo "${GREEN}Initialized Airflow database${RESET}\n"
}

main (){
create_conda_env
install_tf
install_additional_packages
}

main
