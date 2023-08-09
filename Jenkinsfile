pipeline {
    agent any
    tools {
      maven 'maven-3'
    }
    stages {
        stage('build') {
            steps {
                sh "mvn clean install"
            }
        }
        stage('docker image') {
            steps {
                sh "docker build -t mytom /var/lib/jenkins/workspace/hello"
            }
        }
    }
}
