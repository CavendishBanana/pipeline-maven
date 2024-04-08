pipeline {
    agent any
    
    environment {
        PASS = credentials('registry-pass')
    }
    stages {
        stage('Build') {
            steps {
		sh '''
                ./jenkins/build/mvn.sh
		./jenkins/build/build.sh
		'''
            }
	    post{
	        success{
		archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
		}
		always{
		docker stop maven-alpine
		docker rm maven-alpine
		}
	    }
        }
        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh'
            }
	    post{
                always{
                    junit 'java-app/target/surefire-reports/*.xml'
                    docker stop maven-alpine
		    docker rm maven-alpine
		}
            }
        }
	stage('Push'){
	    steps{
		sh './jenkins/push/push.sh'
	    }	
	}
        stage('Deploy') {
            steps {
                sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}
