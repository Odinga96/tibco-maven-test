try{
    node('Master'){ 
         stage('Clone Repository') 
        {
            final scmVars = checkout(scm)
            env.BRANCH_NAME = scmVars.GIT_BRANCH
            env.SHORT_COMMIT = "${scmVars.GIT_COMMIT[0..7]}"
            env.GIT_REPO_NAME = scmVars.GIT_URL.replaceFirst(/^.*\/([^\/]+?).git$/, '$1')
        }
        
        stage('Package') {
            withMaven(maven: 'M3_TIBCO') {
                sh "mvn -f *.parent/pom.xml package"
            }
        }

        stage('Build Docker Image') { 
            sh "cd *.parent"
            sh 'parent=${PWD##*/} && parent=${b%.*} && cd ../'
            sh 'mv $parent/target/*.ear app.ear && ls'
            app = docker.build("service-dev/${env.GIT_REPO_NAME}") 
        }

        stage('Clean') {
            withMaven(maven: 'M3_TIBCO') {
               sh "mvn -f *.parent/pom.xml clean"
            }
        }
    }
    
}catch(Error|Exception e) {
  throw e
} finally {
}
