pipeline {

    agent none
 
//    triggers { 
//        webhook(pattern: "github", hookUrl: "http://54.163.78.47/:8080/github-webhook/")
//    }

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
                       withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                           sh 'terraform plan'
                       }
                       
                   }
               }
                stage('Terraform Apply'){
                    
                    steps{
                        withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                            echo 'terraform apply'
                            sh 'terraform apply --auto-approve'
                        }
                            
                    }
                    
                }
                
            }
        } 
            
    }
 
}
