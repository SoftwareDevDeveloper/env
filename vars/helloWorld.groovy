def call() {
    sh '''
        cd codebase
        terraform init -backend-config=../env/"${TARGET_ENV}"/backend.tfvars
        terraform plan -var-file ../env/"${TARGET_ENV}"/backend.tfvars  -var-file ../env/"${TARGET_ENV}"/ec2.tfvars 
        '''
}