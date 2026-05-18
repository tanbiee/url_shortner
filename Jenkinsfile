pipeline {
    agent any

    // Optional: Define tools if configured in Jenkins Global Tool Configuration
    // tools {
    //     maven 'Maven3'
    //     jdk 'JDK17'
    // }

    environment {
        IMAGE_NAME = 'url-shortener'
    }

    stages {
        stage('Checkout') {
            steps {
                // Check out the code from the repository
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Run Maven build (Using 'bat' for Windows, change to 'sh' for Linux/Mac)
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                // Run tests
                bat 'mvn test'
            }
        }

        stage('Docker Build') {
            steps {
                // Build the Docker image
                bat "docker build -t ${IMAGE_NAME}:${env.BUILD_ID} -t ${IMAGE_NAME}:latest ."
            }
        }

        // --- OPTIONAL: Uncomment to push to Docker Hub ---
        // stage('Docker Push') {
        //     environment {
        //         // The ID of the credentials you created in Jenkins for Docker Hub
        //         DOCKER_CRED = credentials('docker-hub-credentials') 
        //     }
        //     steps {
        //         bat "echo %DOCKER_CRED_PSW% | docker login -u %DOCKER_CRED_USR% --password-stdin"
        //         bat "docker push ${IMAGE_NAME}:${env.BUILD_ID}"
        //         bat "docker push ${IMAGE_NAME}:latest"
        //     }
        // }
    }
    
    post {
        always {
            // Clean up workspace after build
            cleanWs()
        }
    }
}
