pipeline{

	agent {label 'linux'}

	environment {
		DOCKERHUB_CREDENTIALS=credentials('phoomrapee-dockerhub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/phoomrapee-pee/test-jenkins-dockerhub.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t thetips4you/nodeapp_test:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push phoomrapee/jenkins-pipleine:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
