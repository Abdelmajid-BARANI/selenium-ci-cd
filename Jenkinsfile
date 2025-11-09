pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ton_nom/selenium-ci-cd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t selenium-tests .'
                }
            }
        }

        stage('Run Tests in Docker') {
            steps {
                script {
                    sh 'docker run --rm -v $PWD/target:/app/target selenium-tests'
                }
            }
        }

        stage('Publish Reports') {
            steps {
                junit 'target/surefire-reports/*.xml'
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: true, keepAll: true,
                    reportDir: 'target/surefire-reports', reportFiles: 'index.html', reportName: 'Test Report'])
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminé — Résultats disponibles dans Jenkins'
        }
    }
}
