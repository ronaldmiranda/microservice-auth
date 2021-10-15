node {
    checkout scm
    stage "feching helm repo"
        sh "helm dependency update ./helm"
    stage('Deploy to cluster') {
        sh 'helm install ./helm --set microservice-deploys.container.namespace=microservice-ns --generate-name --kubeconfig /home/ubuntu/.kube/config'
    }
}
