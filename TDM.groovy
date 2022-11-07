pipeline{
    agent any
    parameters{
        choice(name:'TDM ENV', choices: ['dev','test','prod'],description:'')
    }
    stages{
        // stage('BitBucket checkout '){
        //     steps{
        //     }
        // }
        stage('Deploy to instance'){        
            steps{
                script{
                }
            }
        }
        stage('Deploy ENV Variables'){
            steps{
                script{
                }
                sh './Deploy_ENV.sh'
            }
        }    
        stage('Deploy WSs'){
            steps{
                script{
                }
                sh './Deploy_WSs.sh'
            }
        }
        stage('Deploy LUs'){
            steps{
                script{
                }
                sh './Deploy_LUs.sh'

            }
        }
    }               
}        
    
