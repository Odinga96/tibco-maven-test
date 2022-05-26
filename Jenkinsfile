try{
    node('Master'){
        
        stage('Package') {
            withMaven(maven: 'Tibco-M3') {
                sh "mvn -f *.parent/pom.xml package"
            }
        }

        stage('Build Docker Image') { app = docker.build("service-dev/${env.GIT_REPO_NAME}") }

        stage('Clean') {
            withMaven(maven: 'Tibco-M3') {
               sh "mvn -f *.parent/pom.xml clean"
            }
        }
    }
    
}catch(Error|Exception e) {
  throw e
} finally {
}
