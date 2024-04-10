pipeline {
    agent any
    
    environment {
        PASS = credentials('registry-pass')
	PROD_MACHINE_IP = params.IP_PROD_MACHINE
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
		sh '''
		ls -la
		pwd
		'''
		archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
		}
	    }
        }
        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh test'
            }
        }
	stage('Push'){
	    steps{
		sh './jenkins/push/push.sh'
	    }	
	}
        stage('Deploy') {
            steps {
                sh './jenkins/deploy/deploy.sh $PROD_MACHINE_IP' 
            }
        }
    }
}
