pipeline {
    agent any

    environment {
        GIT_REPO_URL = 'https://github.com/MazenIss/ansible-jenkins-pipeline.git'
        GIT_CREDENTIALS_ID = 'git-credentials'
    }

    stages {
        stage('Fetch from Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']],
                    userRemoteConfigs: [[credentialsId: GIT_CREDENTIALS_ID, url: GIT_REPO_URL]]])
            }
        }

        stage('Run Playbook') {
            steps {
                script {
                    ansiblePlaybook credentialsId: 'ssh-cred',
                        disableHostKeyChecking: true,
                        installation: 'Ansible',
                        inventory: "${WORKSPACE}/ansible/hosts.yml",
                        playbook: "${WORKSPACE}/ansible/playbook.yml"
                }
            }
        }
    }
}
