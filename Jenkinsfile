pipeline {
    agent any
    environment {
      tomcatserver = "35.237.116.77" 
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
                //sh 'scp target/JenkinsWar.war http://35.237.116.77:8080' 
                //sh 'scp -r ./* 34.74.207.1:/var/lib/jenkins/maven-project'
                sh 'scp -o StrictHostKeyChecking=no target/*.war root@$tomcatserver:/opt/tomcat/tomcat9/webapps'
            }
          }
        } 
        stage('Clean up stage') {
          steps {
            //sh 'ssh 35.196.97.240 "sudo ansible-playbook /home/jenkins/ansible/verify.yml"'
            //sh 'ssh jenkins@35.196.97.240 "rm /home/jenkins/ansible/*verify*"'
            sh 'mvn clean'
          }
        } 
      }  
    } 
