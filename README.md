<<<<<<< HEAD
# aws-terraform ...
=======

pipeline {

    agent none

    stages {
        stage('Git'){
            agent any
            stages{
                stage('Git checkout'){  
                    steps{
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jndansi/aws-terraform.git']]])
                    }
                }
            }
        }
        
        
        stage('Terraform'){
            agent any
            stages{
                stage('Terraform Init'){
                    
                    steps{
                        sh 'terraform init'
                    }
                }
                stage('Terraform Plan'){
                    
                    steps{
                        withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'jndansi-aws-creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                            sh 'terraform plan'
                        }
                        
                    }
                }
                stage('Terraform Action'){
                    
                    steps{
                        withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'jndansi-aws-creds', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                            echo 'terraform ${Action}'
                            sh 'terraform ${Action} --auto-approve'
                        }
                            
                    }
                    
                }
                
            }
        } 
            
    }
 
}
>>>>>>> 5c1a881899c160a240e4ea9a26e95ae209109a55
