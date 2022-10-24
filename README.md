# GIT Continous Integration/Continous Delivery Using Docker Containers
## Github Actions- Docker Stages

![Applaudo.png](https://i.postimg.cc/Kc5J8TGf/Applaudo.png)
    
This week challenge is focused on complementing the CI/CD cycle using the same Github Actions pipeline from last week and integrating Docker for containerizinga template JS application deployed in React. Another important topic to cover is the usage of Docker Multi-staging methods to optimize computing and storage reources udes by the app. 


## Deployment Steps

- Create a directory in your GIT bash or Linux terminal where you can deploy and clone the repository:

```sh
https://github.com/renzzog777/React_HW.git
```

- Assuming you already have GIT installed on your machine, you have to initialize the Gitflow method on GIT with this comand:

```sh
git flow init
```
Follow the suggested configuration by default until the end.

- The following step is to create a new Feature branch, you'll use this branch apply all the necessary cahnge to the source code. To create it, enter this command of Git Flow:
```sh
git flow feature start feature_branch
```
Replace the text "feature_branch" for a custom name skipping the "feature" prefix.

- Check  out to the new created branch and perform all the necessary changes in the source code of the CSS App (Preferably in /scr/App.jsx for practicality)

-After that, perform all the regular GIT command to commit and push the changes into the feature remote branch of the repository.

```sh
git add .
git commit -m "Message"
git push origin feature/"created branch"
```
- Github will request for the repository token, these are the credentials (Token is coded in base 64):

```sh
User: renzzog777
token: 'Z2hwX2Eyc3BxRkl6OXdOV1RUNk9heE14dXpNTDRaTXE4ZDMzSUdLQQ=='
```
You can decode the token with the following command:
```sh
echo 'given coded token' | base64 --decode
```

- The changes will be automatically upload into the remote 'develop' branch. Under the "actions" tab you must see a message like this: 

![automerge.png](https://i.postimg.cc/VLXxWg88/automerge.png)

This lets you know that feature branch  is merging into develop branch. The feature branch will be automatically deleted from the remote repository.

- As in real production environments, the repository admin will receive a pull-request, if everything's ok, he/she will accept it and merge 'develop' branch and 'master' branch with a couple of clicks.

Once they are merged, all the cahanges will rest in the master branch which is our default branch for releases and deployment.

- Now another Github Action will be trigered by a sumple push on the main branch, it's the Docker.yml file which contains all the necessary instructions to install all the mandatory dependencies,  build the docker image and finally push to a remote repository on Dockerhub (It is necessary to create a new repository and create secrets like Name User and Password to include them in the file Docker.yml). You must see the following sucess message in the Github actiosn section:

![Docker.png](https://i.postimg.cc/K8rkCWSx/CI.png)

And all the processes explained to the detail when you click on the action:

![Docker process.png](https://i.postimg.cc/T3wp1JKX/Process.png)

- Once it is done, we can see that the image has been succesfully pushed into the Dockerhub repository:

```sh
docker pull renzzog77/ga_ds:0.0.50
```
![dockerhub.png](https://i.postimg.cc/G2rBLwYX/dockerhub.png)

- The next step would be to run the container in a local or virtual machine with Docker previously installed:

```sh
docker run -d -p 8080:80 --name "Chosen_Name" renzzog77/ga_ds:"Dockerhub_Tag"
```
![dockerrun.png](https://i.postimg.cc/CKCHYVdK/Dockerrun.png)

In the image we can see that the container is created correctly, it's up and running, besides it is possible to see that the image's size is 23 MB approx; the original size of the image was 142 MB but thanks to the Docker Multi-Stages technique we can skip some useless layers at this point.

- Going to a browser we can visualize the web app running typing the localhost selected port:

```sh
localhost:8080
```
![App2.png](https://i.postimg.cc/kMHXy1v1/App2.png)

In this case we used a predefined JS template deployed in React which basic function is activate a counte on every click of the center button and has some other links to React interest subjects.


## Workflows

| File  | Action |
| ------ | ------ |
| Auto_Merge.yml | Detects PR's in the feature branch and merges with the 'develop' branch|
| Master.yml | Sends the PR to the repo for authorization, and merges 'develop' and 'master' later |
| Docker.yml | Checks the code, Installs JS and React dependencies, builds the Docker image, logs in and pushes the new image into Dockerhub |



## Author

Renzzo Gomez Reatiga
AWS DevOps- Trainnee.

Applaudo Studios

**rgomez@applaudostudios.dev**
