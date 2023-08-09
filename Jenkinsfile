pipeline {
    agent any
    tools {
      maven 'maven-3'
    }
    stages {
        stage('build') {
            steps {
                timeout(time: 45, unit: 'SECONDS') {
                    sh "mvn clean install -D.maven.test.skip=true"
                }
            }
        }
        stage('docker image') {
            steps {
                sh "docker build -t mytom /var/lib/jenkins/workspace/hello"
            }
        }
        stage('docker container') {
            steps {
                sh "docker run -d --name tommy -p 8090:8080 mytom"
            }
        }
        stage('waiting for approval') {
            steps {
                timeout(time: 5, unit: 'HOURS') {
                    input message: 'are we good to deploy in production', ok: 'Yes'
                }
            }
        }
        stage('deploying in production') {
            steps {
                echo "successfully deployed in production"
            }
        }
    }
    post {
        success {
            mail bcc: '', body: 'test', cc: '', from: '', replyTo: '', subject: 'build is success', to: 'bkaarthic@gmail.com'
            }
        failure {
            mail bcc: '', body: 'test', cc: '', from: '', replyTo: '', subject: 'build failed', to: 'bkaarthic@gmail.com'
            }
        }
}
