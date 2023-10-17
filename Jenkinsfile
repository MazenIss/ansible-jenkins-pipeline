pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    credentialsId: 'github-credentials',
                    url: 'https://github.com/MazenIss/ansible-jenkins-pipeline.git'
            }
        }
        stage('Execute Ansible playbook') {
            steps {
                ansiblePlaybook playbook: 'ansible/playbook.yml'
            }
        }
    }
}