# helm-kubectl-vault Docker hub image. Inspired by dtzar/helm-kubectl

Supported tags and release links

* [3.0.3-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/3.0.3-1.3.2) - helm v3.0.3, kubectl v1.17.2, vault v1.3.2, alpine 3.11
* [3.0.2-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/3.0.2-1.3.2) - helm v3.0.2, kubectl v1.17.0, vault v1.3.2, alpine 3.10
* [3.0.1-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/3.0.1-1.3.2) - helm v3.0.1, kubectl v1.16.3, vault v1.3.2, alpine 3.10
* [3.0.0-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/3.0.0-1.3.2) - helm v3.0.0, kubectl v1.16.2, vault v1.3.2, alpine 3.10
* [2.16.1-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/2.16.1-1.3.2) - helm v2.16.1, kubectl v1.16.2, vault v1.3.2, alpine 3.10
* [2.16.0-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/2.16.0-1.3.2) - helm v2.16.0, kubectl v1.16.2, vault v1.3.2, alpine 3.10
* [2.15.2-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/2.15.2-1.3.2) - helm v2.15.2, kubectl v1.16.2, vault v1.3.2, alpine 3.10
* [2.15.1-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/2.15.1-1.3.2) - helm v2.15.1, kubectl v1.16.2, vault v1.3.2, alpine 3.10
* [2.15.0-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/2.15.0-1.3.2) - helm v2.15.0, kubectl v1.16.2, vault v1.3.2, alpine 3.10
* [2.14.3-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/2.14.3-1.3.2) - helm v2.14.3, kubectl v1.15.2, vault v1.3.2, alpine 3.10
* [2.14.2-1.3.2](https://github.com/aido93/helm-kubectl-vault/releases/tag/2.14.2-1.3.2) - helm v2.14.2, kubectl v1.15.0, vault v1.3.2, alpine 3.10

## Overview

This lightweight alpine docker image provides kubectl, helm and vault binaries for working with a Kubernetes cluster.  A local configured kubectl is a prerequisite to use helm per [helm documentation](https://github.com/kubernetes/helm/blob/master/docs/quickstart.md).  This image is useful for general helm administration such as deploying helm charts and managing releases. It is also perfect for any automated deployment pipeline needing to use helm which supports docker images such as [Concourse CI](https://concourse.ci), [Jenkins on Kubernetes](https://kubeapps.com/charts/stable/jenkins), [Travis CI](https://docs.travis-ci.com/user/docker/), and [Circle CI](https://circleci.com/integrations/docker/).  Having bash installed allows for better support for troubleshooting by being able to exec / terminal in and run desired shell scripts.  Git installed allows installation of [helm plugins](https://github.com/kubernetes/helm/blob/master/docs/plugins.md).

If it is desired to only use kubectl and have kubectl as the entry command (versus this image as bash entry command), I recommend checking out this image instead:
[lachlanevenson/kubectl](https://hub.docker.com/r/lachlanevenson/k8s-kubectl/)

## Run

Example to just run helm on entry:
`docker run --rm aido93/helm-kubectl-vault helm`
By default kubectl will try to use /root/.kube/config file for connection to the kubernetes cluster, but does not exist by default in the image.

Example for use with personal administration or troubleshooting with volume mount for kubeconfig files:
`docker run -it -v ~/.kube:/root/.kube aido93/helm-kubectl-vault`
The -v maps your host docker machine Kubernetes configuration directory (~/.kube) to the container's Kubernetes configuration directory (root/.kube).

## Build

For doing a manual local build of the image:
`make docker_build`

This image is now fully automated via travisci.org.
For reference this .travis.yml file can be validated via:
`docker run --rm -it -v yourclonedreporoot:/project caktux/travis-cli lint ./travis.yml`
