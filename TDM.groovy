pipeline{
    agent any
    parameters{
        choice(name:'tdm ENV', choices: ['dev','test','prod'],description:'')
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
            }
        }    
        stage('Deploy WSs'){
            steps{
            }
        }
        stage('Deploy LUs'){
            steps{
            }
        }
    }               
}        
    
