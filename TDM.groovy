pipeline{
    agent any
    parameters{
        choice(name:'TDM ENV', choices: ['dev','test','prod'],description:'')
    }
    stages{
        stage('BitBucket checkout '){
            steps{
            }
        }
        stage('Deploy to instance'){        
            steps{
            }
        }
        stage('Deploy ENV Variables'){
            steps{
                sh './Deploy_ENV.sh'

            }
        }    
        stage('Deploy WSs'){
            steps{
              sh './Deploy_WSs.sh'
            }
        }
        stage('Deploy LUs'){
            steps{
                sh './Deploy_LUs.sh'

            }
        }
    }               
}        
    
