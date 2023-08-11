pipeline {
  agent any
  tools {
    maven 'maven-3.9'
  }
  stages{
    stage('Build') {
      steps {
        sh "mvn clean install -D.maven.test.skip=true"
      }
    }
    stage('Unit Test') {
      steps {
        sh "mvn surefire-report:report"
      }
    }
  }
}
