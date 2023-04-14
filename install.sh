#!/bin/sh
sudo apt-get update
#Upgrade the system if necessary
sudo apt-get upgrade -y
#See if git is installed
git --version
#Install with superuser priviledges
sudo apt install git
#Install JSON Parser
sudo apt install -y jq
#Install base Computing Environment with conda-forge channel for mamba
conda install -n base -c conda-forge mamba
#Activate Base Environment
conda activate base
#Create Snakemake Computing Environment
mamba create -c conda-forge -c bioconda -n snakemake snakemake
#Activate Snakemake Envinronment
conda activate snakemake
