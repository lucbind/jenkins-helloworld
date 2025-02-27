pipeline {
    agent any
    
    stages {
        stage('Fetch dependencies') {
        /* This stage pulls the latest image from
           Dockerhub */
            steps {
                sh 'sudo docker pull karthequian/helloworld:latest'
          }
        }
        stage('Build docker image') {
        /* This stage builds the actual image; synonymous to
           docker build on the command line */
            steps {
            sh "sudo docker build . -t customapp:1"
            }    
        }
        stage('Test image') {
         /* This stage runs unit tests on the image; we are
            just running dummy tests here */
            steps {
                sh 'echo "Tests successful"'
          }
        }
        stage('Push image to OCIR') {
         /* Final stage of build; Push the 
            docker image to our OCI private Registry*/
        steps {
            sh "sudo docker login -u 'emeaseitalysandbox/oracleidentitycloud/luca.bindi@oracle.com' -p 'uASDz34:E0c)4i0uh{m]' eu-frankfurt-1.ocir.io"
            sh "sudo docker tag customapp:1 eu-frankfurt-1.ocir.io/emeaseitalysandbox/customapp:custom"
            sh 'sudo docker push eu-frankfurt-1.ocir.io/emeaseitalysandbox/customapp:custom'
            
           }
         } 
         stage('Deploy to OKE') {
         /* Deploy the image to OKE*/
        steps {
            /*sh "'sudo cp /var/lib/jenkins/workspace/deploy.sh /var/lib/jenkins/workspace/jenkins-oci_master'"*/
            sh 'sh ../../hello-deploy.sh'
           }
         }     
    }
}
