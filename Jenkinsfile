pipeline {
    agent any

    stages {
        stage('Compile using Maven') {
            agent {
                docker {
                    image 'maven:3.8.5-openjdk-17'
                    reuseNode true
                }
            }
            steps {
                sh 'java -version'
                sh 'mvn -version'
            }
        }
    }
}