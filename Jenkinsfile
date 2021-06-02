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
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp mohan/samplewebapp:latest'
                //sh 'docker tag samplewebapp mohan/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        //withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
         // sh  'docker push mohan/samplewebapp:latest'
        //  sh  'docker push mohan/samplewebapp:$BUILD_NUMBER' 
       // }
	withDockerRegistry(credentialsId: 'Dockerhub', url: 'https://hub.docker.com/') {
	sh  'docker push mohan/samplewebapp:latest'
    // some block
}
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 mohan/samplewebapp"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 mohan/samplewebapp"
 
            }
        }
    }
	}
    
