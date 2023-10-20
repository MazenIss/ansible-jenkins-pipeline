pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/MazenIss/ansible-jenkins-pipeline.git'
        GIT_CREDENTIALS_ID = 'git-credentials'
        imagename = "mazenissaoui2000/ob-item"
        registryCredential = 'dockerhub-credentials'
        dockerImage = ''
    }

    stages {
        stage('Fetch from Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']],
                    userRemoteConfigs: [[credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL]]])
            }
        }

        stage('Building image') {
            steps{
                script {
                    dockerImage = docker.build imagename
                }
            }
        }
    
        stage('Deploy Image to Dockerhub') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                    }
                }
        }
        stage('Deploy with Ansible') {
            steps {
                sh 'ansible-playbook -i ansible/hosts.yml ansible/playbook.yml'
            }
        }
    }
}
