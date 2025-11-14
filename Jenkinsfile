pipeline {
  agent any

  parameters {
    string(name: 'AWS_REGION', defaultValue: 'us-east-1')
    string(name: 'INSTANCE_TYPE', defaultValue: 't2.micro')
    string(name: 'AMI_ID', defaultValue: 'ami-0c02fb55956c7d316')
    string(name: 'TAG_ENV', defaultValue: 'DEV')
  }

  stages {
    stage('Checkout') {
      steps { git branch: 'main', url: 'https://github.com/manohars17/EC2_instance_repo.git'}
    }

    stage('Create EC2') {
      steps {
        sh '''
        export AWS_REGION=${AWS_REGION}
        export INSTANCE_TYPE=${INSTANCE_TYPE}
        export AMI_ID=${AMI_ID}
        export TAG_ENV=${TAG_ENV}
        bash create_ec2.sh
        '''
      }
    }

    stage('Terminate EC2') {
      steps {
        input message: 'Terminate Instance?'
        sh 'bash scripts/terminate_ec2.sh'
      }
    }
  }
}
