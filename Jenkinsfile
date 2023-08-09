pipeline {
    agent any
    tools {
      maven 'maven-3'
    }
    stages {
        stage('build') {
            steps {
                sh "mvn clean install -D.maven.test.skip=true"
            }
        }
        stage('prune image') {
            steps {
                sh '''
                    docker stop tommy
                    docker rm tommy
                    docker rmi mytom
                   '''
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
    }
}
