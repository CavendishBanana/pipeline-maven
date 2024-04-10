pipeline {
    agent any
    
    environment {
        PASS = credentials('registry-pass')
    }
    stages {
        stage('Build') {
            steps {
		sh '''
                ./jenkins/build/mvn.sh  mvn -B -Dskiptests clean package
		./jenkins/build/build.sh
		'''
            }
	    post{
	        success{
		archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
		}
	    }
        }
        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh'
            }
	    post{
                always{
		sh '''
                    junit '/app/target/surefire-reports/*.xml'
		'''
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
