# PolarFlow

I wanted to make a standardized data analysis workflow for PolarFlow. For those who are not familar with Polar Flow I will briefly describe it. Anyone who wants to train in fitness now can use a heart rate monitor to judge where that person is with respect to different heart rate zones. There are a total of five zones when it comes to Polar Flow. Zone 1 represents the lightest type of exercise. Zone 2 is what I call the fat burning zone. Zone 3 is moderate cardio. Zone 4 is Anaerobic Exercise (Vigourous). And finally, Zone 5 is Anaerbobic exercise (Most Vigourous). This is the zone where most can reach their maximum heart rate. The developers at Polar Flow have made an application you can download from Playstore on any smartphone. However, they also allow a user of the app who has an account to "download" their data. This is where my workflow comes in to play. After downloading your sessions they are in a .JSON (Java Script Object Notation). Very hard to just read it because there are a lot of arrays in objects all generated from a single exercise session. So what do you do with it and why? Without parsing the data it is almost not useable. So why do they even give you this data? 

In my workflow I basically parse the (.JSON) training data with jq. Currenlty I am on Jammy version of Linux Ubuntu...

It is very important to consider whether you have properly installed conda. Please visit this website and choose the correct version for you operating system. I prefer a minimalist installation of conda with miniconda.

https://docs.conda.io/en/latest/miniconda.html

You will then see a bash file downloading that looks similar to this.

**Miniconda3-latest-Linux-x86_64.sh**

And then execute the bash script

```
bash Miniconda3-latest-Linux-x86_64.sh
```
**Verify it has been installed.**

```
which conda

/home/user/miniconda3/condabin/conda

```
**Which version of conda?

```
conda --version

conda 23.3.1

```

**If you need help

```
conda --help

```

**Verify your linux OS

```
lsb_release -a

Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.2 LTS
Release:	22.04
Codename:	jammy

```
**You can install all necessary prerequisite software by issuing the following command.

```
bash install.sh

```


***If you want to do it step by step.

```
sudo apt update

sudo apt install -y jq

```
**When installation is finished, check jq version:

```
jq --version

jq-1.6

```
**You will also need to install snakemake.

```
conda install -n base -c conda-forge mamba

conda activate base

mamba create -c conda-forge -c bioconda -n snakemake snakemake

conda activate snakemake

snakemake --help

```

![Screenshot from 2023-04-14 11-14-15](https://user-images.githubusercontent.com/129086783/232099338-d7443b3e-8f83-4b96-9211-34a2b0096799.png)


**Now you must clone the Github Repository

```

git clone https://github.com/MichaelDHallPolarFlow/PolarFlow.git

```

**Change Working Directories

```

cd PolarFlow

```
**Make a tree 

```
tree
```

***Here is a screen shot

![Screenshot from 2023-04-14 12-16-37](https://user-images.githubusercontent.com/129086783/232112980-815939fe-8415-4d36-8851-1aad3bcf8bbe.png)


**Configure bash/jq.sh file with name of particular exercise

```

nano bash/jq.sh


```

![Screenshot from 2023-04-14 12-25-35](https://user-images.githubusercontent.com/129086783/232114737-eb9956e1-a2ee-4c90-a191-edbaba2fcd08.png)

**In this case it is STRENGTH_TRAINING**

**You can change it to any exercise as long as there is a record that you completed that exercise in your training.json files.**

**The limitation to this workflow is you can only run one exercise per snakemake run.**

**This means you have to run the workflow multiple times for different exercises.**

**Just be sure to before running snakemake again delete everything in TextFiles and output Directories.**

**You might want to save the Rplot.pdf file and rename it to say for example, Strength_Training_Rplot.pdf**

**Run the snakemake file**

```

snakemake --cores 2 RScript

```

**Your TextFiles and output directories should now have been popoulated. More importantly there should be a Rplots.pdf file somewhere in the root directory.

**We will take a look out the snakemake output


![Screenshot from 2023-04-14 12-20-03](https://user-images.githubusercontent.com/129086783/232113682-fba2b1dd-4471-48ce-802e-5c1a49495351.png)




**And the new tree


![Screenshot from 2023-04-14 12-21-29](https://user-images.githubusercontent.com/129086783/232113906-6a491742-836f-44d9-a01d-c48a6385944a.png)


**Finally we can inspect the Final.txt file which contains all relevant data.

```

nano TextFiles/Final.txt

```

![Screenshot from 2023-04-14 12-23-51](https://user-images.githubusercontent.com/129086783/232114413-9d52e56d-9014-4141-880d-6dba9db31e4e.png)


**This is the input file for the Rscript which produces the Rplot.pdf file**
[Rplots.pdf](https://github.com/MichaelDHallPolarFlow/PolarFlow/files/11235560/Rplots.pdf)


