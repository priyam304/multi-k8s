# The-DevOps-Project
### Project Overview
<img src="https://github.com/priyam304/The-DevOps-Project/blob/master/CICD_Pipeline.png">

The goal of this project is to utilize different Cloud provider services and DevOps tool to create a robust Continuous Integration Continuous Deployment Workflow.
- Terraform is used to spinup a Google container cluster on GCP.
- Github commit will trigger a build in Jenkins
- Jenkins will build the project and test the build
- On passing the test, Jenkins will deploy the application to GCP utilizing Google Kubernetes Engine and push the docker images to Dockerhub.

### Architecture
<img src="https://github.com/priyam304/The-DevOps-Project/blob/master/application_architecture.png">

The application is divided in 5 different microservice
- Client: Front end written in ReactJS.
- Server: Backend API to interact with database
- Worker: A service that does the actual computation and stores the result into database
- Postgres Database: Database for persistent storage
- Redis Cache: Caching Mechanism for faster lookup
 

### Tools and Technologies
- Docker
- Kubernetes
- Jenkins
- Terraform
- Google Cloud Platform


