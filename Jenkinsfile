@Library('jenkins-library@feature/DOPS-1192' ) _

def pipeline = new org.docker.AppPipeline(steps: this,
    dockerImageName: 'sora2/polkascan-pre-explorer-api',
    dockerRegistryCred: 'bot-sora2-rw',
    dockerImageTags: ['feature/DOPS-1192': 'latest'],
    gitUpdateSubmodule: true)
pipeline.runPipeline()