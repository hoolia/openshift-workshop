
== Proxy node ==
Execute following on a node that has connection to the internet and a connection to the internal docker-registry

<pre>
docker login docker-internal.mycompany.com
docker pull docker.io/sterburg/workshop-spawner:7.0.1
docker tag docker.io/sterburg/workshop-spawner:7.0.1 docker-internal.mycompany.com/openshift-workshop/workshop-spawner:7.0.1
docker push docker-internal.mycompany.com/openshift-workshop/workshop-spawner:7.0.1

docker pull docker.io/sterburg/workshop-terminal:3.4.2
docker tag docker.io/sterburg/workshop-terminal:3.4.2 docker-internal.mycompany.com/openshift-workshop/workshop-terminal:3.4.2
docker push docker-internal.mycompany.com/openshift-workshop/workshop-terminal:3.4.2

docker pull docker.io/sterburg/workshop-dashboard:5.0.0
docker tag docker.io/sterburg/workshop-dashboard:5.0.0 docker-internal.mycompany.com/openshift-workshop/workshop-dashboard:5.0.0
docker push docker-internal.mycompany.com/openshift-workshop/workshop-dashboard:5.0.0

docker pull docker.io/sterburg/origin-console:4.2
docker tag docker.io/sterburg/origin-console:4.2 docker-internal.mycompany.com/openshift-workshop/origin-console:4.2
docker push docker-internal.mycompany.com/openshift-workshop/origin-console:4.2

docker pull  docker.io/sterburg/lab-getting-started:ocp-4.2
docker tag  docker.io/sterburg/lab-getting-started:ocp-4.2 docker-internal.mycompany.com/openshift-workshop/lab-getting-started:ocp-4.2
docker push docker-internal.mycompany.com/openshift-workshop/lab-getting-started:ocp-4.2

docker pull docker.io/sterburg/parksmap:1.3.0
docker tag docker.io/sterburg/parksmap:1.3.0 docker-internal.mycompany.com/openshift-workshop/parksmap:1.3.0
docker push docker-internal.mycompany.com/openshift-workshop/parksmap:1.3.0
</pre>

=== Alternatives ===
* use `docker save; scp; docker load` (download as tarball; copy tarball; unpack tarbal)
* use `skopeo` tool (doesn't require docker-engine)


== OpenShift node ==
Optional step if you want to use OCR as the docker-registry that hosts these images.

<pre>
oc -n default get route docker-registry
oc whoami -t
docker login --username dummy --password `oc whoami -t` docker-registry-default.apps.mycompany.com
docker login docker-internal.mycompany.com

docker pull docker-internal.mycompany.com/openshift-workshop/workshop-dashboard:5.0.0
docker tag  docker-internal.mycompany.com/openshift-workshop/workshop-dashboard:5.0.0 docker-registry-default.apps.mycompany.com/workshops/workshop-dashboard:5.0.0
docker push docker-registry-default.apps.mycompany.com/workshops/workshop-dashboard:5.0.0

docker pull docker-internal.mycompany.com/openshift-workshop/origin-console:4.2
docker tag  docker-internal.mycompany.com/origin-console:4.2 docker-registry-default.apps.mycompany.com/workshops/origin-console:4.2
docker push docker-registry-default.apps.mycompany.com/workshops/origin-console:4.2

docker pull docker pull docker-internal.mycompany.com/openshift-workshop/workshops:7.0.1
docker tag  docker-internal.mycompany.com/openshift-workshop/workshops:7.0.1 docker-registry-default.apps.mycompany.com/workshops/workshops:7.0.1
docker push docker-registry-default.apps.mycompany.com/workshops/workshops:7.0.1

docker pull docker pull docker-internal.mycompany.com/openshift-workshop/workshop-terminal:3.4.2
docker tag docker-internal.mycompany.com/openshift-workshop/workshop-terminal:3.4.2 docker-registry-default.apps.mycompany.com/workshops/workshop-terminal:3.4.2
docker push docker-registry-default.apps.mycompany.com/workshops/workshop-terminal:3.4.2

docker pull docker pull docker-internal.mycompany.com/openshift-workshop/parksmap:1.3.0
docker tag docker-internal.mycompany.com/openshift-workshop/parksmap:1.3.0 docker-registry-default.apps.mycompany.com/workshops/parksmap:1.3.0
docker push docker-registry-default.apps.mycompany.com/workshops/parksmap:1.3.0

oc -n workshops policy add-role-to-group system:image-puller system:unauthenticated
</pre>
