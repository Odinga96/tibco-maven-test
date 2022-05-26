try{
    node('Master'){
        maven 'M3_TIBCO' 
        
        stage('Package') {
//             withMaven(maven: 'M3_TIBCO') {
                sh "mvn -f *.parent/pom.xml package"
//             }
        }

        stage('Build Docker Image') { app = docker.build("service-dev/${env.GIT_REPO_NAME}") }

        stage('Clean') {
//             withMaven(maven: 'M3_TIBCO') {
               sh "mvn -f *.parent/pom.xml clean"
//             }
        }
    }
    
}catch(Error|Exception e) {
  throw e
} finally {
}
