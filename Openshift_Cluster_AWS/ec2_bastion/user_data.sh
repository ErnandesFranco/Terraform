#!/bin/bash
set -euxo pipefail

dnf -y update || yum -y update
dnf -y install dnf-plugins-core unzip vim nano tar wget curl || yum -y install yum-utils unzip vim nano tar wget curl

dnf config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo || \
  yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
dnf -y install terraform || yum -y install terraform

curl -fsSLo /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz
tar -xf /tmp/oc.tar.gz -C /tmp oc
install -m 0755 /tmp/oc /usr/local/bin/oc

curl -fsSLo /tmp/rosa-linux.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/rosa/latest/rosa-linux.tar.gz
tar -xf /tmp/rosa-linux.tar.gz -C /tmp rosa
install -m 0755 /tmp/rosa /usr/local/bin/rosa

curl -fsSLo /tmp/awscliv2.zip https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip
unzip -q /tmp/awscliv2.zip -d /tmp
/tmp/aws/install --update
