## Create disk pools to be used by building nodes inside GKE


The goal of this deployment is to create a GKE cluster with an additional node pool used as a build farm for Android builds.
This node pool will use a disk pool that can be prefetched with Android sources and mounted on demand during the autoscaling phase.

It will use a taint on the node pool and a daemon set to mount the disk and remove the taint when the node is ready.

The [notes.txt](notes.txt) file has all the commands used to spin up the environment.

The daemonset is detailed in [daemon-set.yaml](daemon-set.yaml).
It will execute a script which is in fact a config map described in [cm-entrypoint.yaml](cm-entrypoint.yaml).
It will use a specific service account [sa.yaml](sa.yaml) to manage the taint on the nodes and the disk attachment.

The build is simulated by the [deployment.yaml](deployment.yaml) file.

It should be kickstarted by using a job with the right toleration provided here [job.yaml](job.yaml).

Finally, I have also provided a pod [debug-pod.yaml](debug-pod.yaml) to debug the behavior if something does not work as expected.

Do not hesitate to create an issue if there is any questions, remarks, improvements.

**Disclaimer**: This code is only for demonstration purpose. My or my employer responsability could not be involved in this code reutilisation.
