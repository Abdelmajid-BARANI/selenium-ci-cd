pipeline {
    agent any

    tools {
        maven 'Maven3'   // nom configuré dans Jenkins
        jdk 'jdk17'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/tonUser/selenium-ci-cd.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean test'
            }
        }

        stage('Archive Reports') {
            steps {
                junit '**/target/surefire-reports/*.xml'
                archiveArtifacts artifacts: 'target/surefire-reports/*.xml', fingerprint: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminé.'
        }
    }
}
