pipeline {
    agent any
    tools {
        maven 'maven-3.9'
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
        stage('publish') {
            steps {
                sshPublisher(publishers: [sshPublisherDesc(configName: 'tomcat', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/demo', remoteDirectorySDF: false, removePrefix: 'webapp/target', sourceFiles: 'webapp/target/*.war')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
        stage('docker remove') {
                steps {
                    sshagent(['docker-ssh']) {
                        sh 'ssh -o StrictHostKeyChecking=no -l dockeradmin 3.111.198.19 ./demo/remove.sh'
                        }
                }
            }
        stage('deploying in Test') {
                steps {
                    sshagent(['docker-ssh']) {
                        sh 'ssh -o StrictHostKeyChecking=no -l dockeradmin 3.111.198.19 ./demo/build.sh'
                        }
                }
            }
        stage ('deploying in prod') {
                steps {
                    echo "Deployed in production"
                }
        }
    }
}
