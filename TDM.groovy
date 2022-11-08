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
        stage('Copy project code'){        
            steps{
                script{
                    sh '''
                        ssh-keygen -t rsa -f ./.ssh/temp_rsa1 -q -N 'test12'
                        # set correct rights on temp priv ate keyfile
                        chmod 600 ./.ssh/temp_rsa1
                        ssh -F ./cfg/ssh_cfg -i ./cfg/temp_rsa ec2-user@$TARGET_ID "echo 'Sample_Commands';pwd;ls -dal *"
                        ###
                        ssh-keygen -t rsa
                        ssh-copy-id -i .ssh/id_rsa.pub root@10.21.1.11
                        ssh root@10.21.1.11
                        ###
                    '''
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
    
