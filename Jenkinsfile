pipeline {
    agent none

    stages {
        stage('Git') {
            steps {
                script {
                    // Change to the /terraform directory
                    dir('/terraform') {
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jndansi/aws-terraform.git']]])
                    }
                }
            }
        }

        stage('Change to Terraform Directory') {
            steps {
                script {
                    // Change to the /terraform directory
                    dir('/terraform') {
                        echo 'Changed to /terraform directory'
                    }
                }
            }
        }

        stage('Terraform') {
            stages {
                stage('Terraform Init') {
                    steps {
                        script {
                            // Change to the /terraform directory
                            dir('/terraform') {
                                sh 'terraform init -upgrade'
                            }
                        }
                    }
                }
                stage('Terraform Plan') {
                    steps {
                        script {
                            // Change to the /terraform directory
                            dir('/terraform') {
                                withCredentials([[
                                    $class: 'AmazonWebServicesCredentialsBinding',
                                    credentialsId: 'aws-credentials',
                                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                                        sh 'export TF_LOG=debug'
                                        echo 'terraform plan'
                                        sh 'terraform plan'
                                }
                            }
                        }
                    }
                }
                stage('Terraform Apply') {
                    steps {
                        script {
                            // Change to the /terraform directory
                            dir('/terraform') {
                                withCredentials([[
                                    $class: 'AmazonWebServicesCredentialsBinding',
                                    credentialsId: 'aws-credentials',
                                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                                        echo 'terraform apply'
                                        sh 'terraform apply --auto-approve'
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

