pipeline {
    agent any
    environment {
        PATH = "/opt/maven/bin:$PATH"
    }
    stages {
        stage('build') {
            steps {
                sh "mvn clean install -D.maven.test.skip=true"
            }
        }
        stage('unit test') {
            steps {
                sh "mvn surefire-report:report"
            }
        }
        stage('docker image') {
            steps {
                sh "docker build -t mytom /var/lib/jenkins/workspace/first"
            }
        }
        stage('deploying in dev') {
            steps {
                sh "docker run -d --name tommy -p 8081:8080 web"
            }
        }
        stage('approval') {
            steps {
                timeout(time: 15, unit: "MINUTES") {
	                    input message: 'Do you want to approve the deployment?', ok: 'Yes'
	                }
            }
        }
        stage('deployment') {
            steps {
                echo "deployed"
            }
        }
    }
}
