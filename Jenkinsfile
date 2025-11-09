pipeline {
    agent any

    tools {
        maven 'Maven3'   // nom configuré dans Jenkins
        jdk 'jdk17'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Abdelmajid-BARANI/selenium-ci-cd.git'
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
        stage('Allure Report') {
            steps {
                allure([
                    includeProperties: false,
                    jdk: '',
                    results: [[path: 'target/allure-results']]
                ])
            }
        }

    post {
        always {
            echo 'Pipeline terminé.'
        }
    }
}
