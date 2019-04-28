pipeline {
    agent any
    
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
                sh 'mvn package'
            }
          }  
        }  
        stage('Deploy Stage') {
          steps {
            withMaven(maven : 'maven-3.6.1') {
                //sh 'mvn deploy'
                //sh 'ssh 34.74.207.1 "mkdir /var/lib/jenkins/maven-project"'
                sh 'scp ./verify.yml jenkins@35.196.97.240:/home/jenkins/ansible' 
                sh 'scp -r ./* 34.74.207.1:/var/lib/jenkins/maven-project'
                //sh 'ssh root@34.74.207.1 "rm /root/pom.xml"'
              }
            }  
          }
        stage('Clean up Stage') {
          steps {
            withMaven(maven : 'maven-3.6.1') {
                sh 'mvn clean'
            }
          }
        } 
        stage('Ansible syntax check') {
          steps {
            sh 'ssh jenkins@35.196.97.240 "ansible-playbook /home/jenkins/ansible/verify.yml --syntax-check"'
          }
        }
        stage('Ansible playbook test') {
          steps {
            sh 'ssh jenkins@35.196.97.240 "sudo ansible-playbook /home/jenkins/ansible/verify.yml -C"'
            sh 'echo "hostname"'
          }
        }
        stage('Ansible playbook') {
          steps {
            sh 'ssh 35.196.97.240 "sudo ansible-playbook /home/jenkins/ansible/verify.yml"'
            sh 'ssh jenkins@35.196.97.240 "rm /home/jenkins/ansible/*verify*"'
          }
        } 
      }  
    } 
