pipeline {
    agent any
    environment {
        PATH = "/opt/maven/bin:$PATH"
    }
    stages {
        stage('build') {
            steps {
                sh "mvn clean install"
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
                echo "deeep"
            }
        }
    }
}

