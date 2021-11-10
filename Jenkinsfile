node {
    checkout scm
    stage "feching helm repo"
        sh "helm dependency update ./helm"
    stage('Deploy to cluster') {
        sh '''
            helm upgrade --install microservice-auth ./helm \
                         --set microservice-deploys.container.namespace=microservice-ns \
                         --kubeconfig /home/ubuntu/.kube/config
           '''
    }
}
