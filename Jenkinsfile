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
                sh "docker build -t test1 /var/lib/jenkins/workspace/test1"
            }
        }
        stage('deploying in dev') {
            steps {
                sh "docker run -d --name world -p 8088:8080 test1"
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
                echo "successfully deployed in production"
            }
        }
    }
    post {
	    success {
		    mail bcc: '', body: 'successfully deployed', cc: '', from: '', replyTo: '', subject: 'build is successfull', to: 'bkaarthic@gmail.com'
	    }
	    failure {
		    mail bcc: '', body: 'successfully deployed', cc: '', from: '', replyTo: '', subject: 'build failed', to: 'bkaarthic@gmail.com'
	    }
    }
}
