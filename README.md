This repo contains code for React application, Nodejs application and s3 bucket creation scripts. There are multiple terraform scripts folders in this repository. These include 
(1) Reactappdeployment - For deploying React application to be served through cloudfront using S3 bucket with terraform script
(2) Nodejsdeployment - This script deploys Node.js docker image to AWS ECS Fargate by creating a custom VPC
(3) s3scripts - This folder contains two scripts i.e. one to create a private bucket and one to create a public s3 bucket.


Pre-Requistes:
Make sure you have terraform installed on your machine
Make sure you have aws cli configured for your AWS account

You have to first build you react app locally on your machine (Ubuntu) before sending it to S3 bucket for this you have to install Nodejs and npm

sudo apt update

sudo apt install nodejs

sudo apt install npm

Go insdie your project folder (Reactappdeployment) and run the following commands

npm install

npm run build

This will create a build folder and now you can place all the code to s3 to be served with cloudfront

Inside Nodejsdeployment folder there is config.tf file. Just run the file and observe infrastucture provision.

Inside s3buckets folder there are two scripts. One shall create the private bucket and other shall create the public bucket. Run script files subsequently inside their respective
folders to see the desired result.

I have tested all the code and it is running properly in my machine.


