try{
    node('Master'){        
        stage('Package') {
            withMaven(maven: 'M3_TIBCO') {
                sh "pwd && ls -a"
                sh "mvn -f mavenTest.parent/pom.xml package"
            }
        }

        stage('Build Docker Image') { app = docker.build("service-dev/${env.GIT_REPO_NAME}") }

        stage('Clean') {
            withMaven(maven: 'M3_TIBCO') {
               sh "mvn -f mavenTest.parent/pom.xml clean"
            }
        }
    }
    
}catch(Error|Exception e) {
  throw e
} finally {
}
