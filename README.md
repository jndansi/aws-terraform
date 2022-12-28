pipeline {

    agent none

    stages {
        stage('Git'){
            agent{ docker {image 'bitnami/git:latest'} }
            stages{
                stage('Git checkout'){  
                    steps{
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jndansi/aws-terraform.git']]])
                    }
                }
            }
        }
        
        
        stage('Terraform'){
            agent{ docker {image 'terraformdocker/terraform:latest'} }
            stages{
                stage('Terraform Init'){
                    steps{
                        sh 'terraform init'
                    }
                }
                stage('Terraform Plan'){
                    steps{
                        sh 'terraform plan'
                    }
                }
                stage('Terraform Action'){
                    steps{
                        echo 'terraform ${Action}'
                        sh 'terraform ${Action} --auto-approve'
                    }
                }
                
            }
        } 
            
    }
 
}
