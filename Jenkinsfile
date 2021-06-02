pipeline {
    agent any
	
	  tools
    {
       maven "Maven"
    }
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/mohandassm/Docker_CI.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
                  sh 'mvn clean package'
		
                //sh 'cd C:\Windows\System32\config\systemprofile\AppData\Local\Jenkins\.jenkins\workspace\Docker_CI'                           
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp mohandocker226/samplewebapp:latest'
                //sh 'docker tag samplewebapp mohandocker226/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        //withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
         // sh  'docker push mohan/samplewebapp:latest'
        //  sh  'docker push mohan/samplewebapp:$BUILD_NUMBER' 
       // }
		    
	//withDockerRegistry(credentialsId: 'Dockerhub', url: 'https://hub.docker.com/repository/docker/mohandocker226/samplewebapp') 
		//    {
			//    sh  'docker push mohandocker226/samplewebapp:latest'
    // some block
	withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhub')]) {
    // some block
	 sh "docker login -u mohandocker226 -p ${dockerhub}"
       }    
	 sh "docker push mohandocker226/samplewebapp:latest"
             }		   
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 mohandocker226/samplewebapp"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 mohandocker226/samplewebapp"
 
            }
        }
    }
	}
    
