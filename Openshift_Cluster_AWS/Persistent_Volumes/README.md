# Persistent Volume Setup with EFS

This guide explains how to set up a Persistent Volume (PV) and Persistent Volume Claim (PVC) using an AWS EFS file system in a Kubernetes cluster.

## Prerequisites

- An existing AWS EFS file system.
- Kubernetes cluster with access to AWS EFS.
- Kubernetes CSI driver for EFS installed.

## Files Overview

### `storageclass.yml`

Defines the StorageClass that uses the EFS CSI driver.

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: efs-sc
provisioner: efs.csi.aws.com
```

### `pv.yml`
Defines the Persistent Volume that uses the EFS file system.

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: app-data-pv  # Name of the Persistent Volume
spec:
  capacity:
    storage: 375Gi  # Total storage capacity of the PV. Should be greater than or equal to the PVC request
  volumeMode: Filesystem  # Mode of the volume. Filesystem is used for file storage
  accessModes:
    - ReadWriteMany  # Access mode for the PV, allowing multiple pods to read and write
  persistentVolumeReclaimPolicy: Retain  # Reclaim policy for the PV when the PVC is deleted
  storageClassName: efs-sc  # Storage class that defines the EFS storage configuration
  csi:
    driver: efs.csi.aws.com  # CSI driver used for the EFS storage
    volumeHandle: fs-239454932903.efs.us-east-1.amazonaws.com  # EFS file system ID. Replace with your EFS ID
    readOnly: false  # Set to true if the volume should be read-only; false allows read and write
```

### `pvc.yml`
Defines the Persistent Volume Claim that requests storage from the Persistent Volume.
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: app-data-pvc  # Name of the Persistent Volume Claim
spec:
  accessModes:
    - ReadWriteMany  # Access mode for the PVC, allowing multiple pods to read and write
  resources:
    requests:
      storage: 350Gi  # Requested amount of storage. Should match or be less than the PV capacity
  storageClassName: efs-sc  # Storage class that defines the EFS storage configuration
```


### Usage
1. Apply the StorageClass Configuration:

```
kubectl apply -f storageclass.yml
```

2. Apply the Persistent Volume Configuration:

```
kubectl apply -f pv.yml
```

3. Apply the Persistent Volume Claim Configuration:

```
kubectl apply -f pvc.yml
```

4. Verify the Setup:
Check the status of the Persistent Volume and Persistent Volume Claim:

```
kubectl get pv
kubectl get pvc
```

## Licensing
This project is licensed under the MIT License. See the LICENSE file for details.

## Contact
For any questions or feedback, please contact me at [LinkedIn](https://www.linkedin.com/in/ernandesfranco/).

## Explanation
Files Overview: Provides an overview of the YAML files used for the setup.

Usage: Guides users through the process of applying the Kubernetes configurations.

Licensing & Contact: Standard sections for open-source projects.
