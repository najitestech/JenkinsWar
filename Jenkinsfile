pipeline {
    agent any
    environment {
      hosts = "32.44.55.245" 
    }
    
    stages {
        stage('Compile Stage') {
          steps {
            withMaven(maven : 'maven-3.6.1') {
                sh 'mvn clean compile'
            }
          }
        }
        stage('Testing Stage') {
          steps {
            withMaven(maven : 'maven-3.6.1') {
                sh 'mvn test'
            }
          }  
        }  
        stage('Package Stage') {
          steps {
            withMaven(maven : 'maven-3.6.1') {
                 sh 'mvn package'
              }
            }  
          }
        stage('Deploy Stage') {
          steps {
            withMaven(maven : 'maven-3.6.1') {
                //sh 'ssh 34.74.207.1 "mkdir /var/lib/jenkins/maven-project"'
                //sh 'scp ./verify.yml jenkins@35.196.97.240:/home/jenkins/ansible' 
                //sh 'scp -r ./* 34.74.207.1:/var/lib/jenkins/maven-project'
                sh 'mvn deploy @host'
            }
          }
        } 
        stage('Clean up stage') {
          steps {
            //sh 'ssh 35.196.97.240 "sudo ansible-playbook /home/jenkins/ansible/verify.yml"'
            //sh 'ssh jenkins@35.196.97.240 "rm /home/jenkins/ansible/*verify*"'
            sh 'mvn clean  
          }
        } 
      }  
    } 
