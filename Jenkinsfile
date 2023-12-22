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
                       withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsID: 'aws-credentials',
                            accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                            secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {

                                echo 'terraform plan'
                                sh 'terraform plan'
                            }
                        
                            
                    }
               }
                stage('Terraform Apply'){
                    
                    steps{
                       withCredentials([[
                            $class: 'AmazonWebServicesCredentialsBinding',
                            credentialsID: 'aws-credentials',
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
