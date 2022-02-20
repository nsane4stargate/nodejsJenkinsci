node {
   def commit_id
   try {
      stage('Preparation') {
        checkout scm
        sh "git rev-parse --short HEAD > .git/commit-id"                        
        commit_id = readFile('.git/commit-id').trim()
      }
      stage('test') {
        nodejs(nodeJSInstallationName: 'node') {
          sh 'npm install --only=dev'
          sh 'npm test'
        }
      }
      stage('docker build/push') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhubupload') {
          def app = docker.build("nsane4stargate/jenkins-docker-slack-node:${commit_id}", '.').push()
        }
      }
   }catch(e){
      
      // build results
      currentBuild.results = "FAILURE"
      
      // send slack notification
      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

      //throw the error
      throw e;
   }
}
