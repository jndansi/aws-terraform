pipeline{
    agent any
    tools {
        terraform 'terraform-11'
    }
    stages{
        
        stage('Git checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '7055e9dd-ab3c-4269-936c-828ccbb4f096', url: 'https://github.com/jndansi/aws-terraform']]])
            }
        }
        
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
                echo 'terraform ${action}'
                sh 'terraform ${action} --auto-approve'
            }
        }
    }
}
