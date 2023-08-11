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
    stage('Publish') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: 'webserver', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/demo', remoteDirectorySDF: false, removePrefix: 'webapp/target', sourceFiles: 'webapp/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
    stage('Deploy') {
      steps {
        sshagent(['docker']) {
          sh 'ssh -o StrictHostKeyChecking=no -l dockeradmin 65.0.132.43 id'
              }
        }
    }  
  }
}
