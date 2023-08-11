piepline {
  agent any
  tools {
    maven 'maven-3.9'
  }
  stages{
    stage('Build') {
      steps {
        sh "mvn clean install"
      }
    }
  }
}
