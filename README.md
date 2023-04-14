# PolarFlow

I wanted to make a standardized data analysis workflow for PolarFlow. For those who are not familar with Polar Flow I will briefly describe it. Anyone who wants to train in fitness now can use a heart rate monitor to judge where that person is with respect to different heart rate zones. There are a total of five zones when it comes to Polar Flow. Zone 1 represents the lightest type of exercise. Zone 2 is what I call the fat burning zone. Zone 3 is moderate cardio. Zone 4 is Anaerobic Exercise (Vigourous). And finally, Zone 5 is Anaerbobic exercise (Most Vigourous). This is the zone where most can reach their maximum heart rate. The developers at Polar Flow have made an application you can download from Playstore on any smartphone. However, they also allow a user of the app who has an account to "download" their data. This is where my workflow comes in to play. After downloading your sessions they are in a .JSON (Java Script Object Notation). Very hard to just read it because there are a lot of arrays in objects all generated from a single exercise session. So what do you do with it and why? Without parsing the data it is almost not useable. So why do they even give you this data? 

In my workflow I basically parse the (.JSON) training data with jq. Currenlty I am on Jammy version of Linux Ubuntu...

$lsb_release -a

Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.2 LTS
Release:	22.04
Codename:	jammy




$sudo apt update

$sudo apt install -y jq

When installation is finished, check jq version:

$jq --version

jq-1.6


You will also need to install snakemake.

$ conda install -n base -c conda-forge mamba

$ conda activate base
$ mamba create -c conda-forge -c bioconda -n snakemake snakemake

$ conda activate snakemake
$ snakemake --help


![Screenshot from 2023-04-14 11-14-15](https://user-images.githubusercontent.com/129086783/232099338-d7443b3e-8f83-4b96-9211-34a2b0096799.png)


