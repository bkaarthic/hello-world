pipeline {
    agent any
    environment {
	    PATH = '/opt/maven/bin:$PATH'
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
    
    post {
        success {
            mail bcc: '', body: 'test', cc: '', from: '', replyTo: '', subject: 'build is success', to: 'bkaarthic@gmail.com'
            }
        failure {
            mail bcc: '', body: 'test', cc: '', from: '', replyTo: '', subject: 'build failed', to: 'bkaarthic@gmail.com'
            }
        }
}
