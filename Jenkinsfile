node {
   def commit_id
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
       def app = docker.build("nsane4stargate/jenkins-pipeline:${commit_id}", '.').push()
     }
   }
}
