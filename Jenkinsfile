pipeline{
    agent any
    environment{
       
        dockerhub= credentials('dockerhub')
        service=credentials('service')
        USER=credentials('user')
        PATH="/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin/:/Users/${env.USER}/google-cloud-sdk/bin/gcloud:${env.PATH}"
        
    }
    stages{
        stage('prebuild'){
            steps {
                echo 'Starting to build docker image'
                echo "${env.USER}"
                echo "${env.PATH}"
                sh '''
                    
                    gcloud components update kubectl
                    gcloud auth activate-service-account --key-file $service
                    gcloud version | bash > /dev/null;
                    gcloud config set project the-devops-project
                    gcloud config set compute/zone us-central1-c
                    gcloud container clusters get-credentials the-devops-project
                    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                    docker build -t priyam304/client-test -f ./client/Dockerfile.dev ./client
                    '''

                echo 'Prebuild stage complete!'
                
            }
        }
    }
}
