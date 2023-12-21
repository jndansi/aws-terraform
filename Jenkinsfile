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
                        sh 'terraform init -upgrade'
                    }
                }
               stage('Terraform Plan'){
                   
                   steps{
                       
                       withCredentials([<object of type com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]) {
                           echo $AWS_SECRET_ACCESS_KEY
                           sh 'terraform plan'
                       }
                       
                   }
               }
                stage('Terraform Apply'){
                    
                    steps{
                        withCredentials([<object of type com.cloudbees.jenkins.plugins.awscredentials.AmazonWebServicesCredentialsBinding>]) {
                            echo 'terraform apply'
                            sh 'terraform apply --auto-approve'
                        }
                            
                    }
                    
                }
                
            }
        } 
            
    }
 
}
