Lab - Getting Started
=====================

This is a workshop for introducing developers to OpenShift.

Deploying the Workshop
----------------------

To deploy the workshop, first clone this Git repository to your own machine. Use the command:

```
git clone https://github.com/hoolia/openshift-workshop.git
```

```
oc new-project workshops
```

From within the top level of the Git repository, now run:

```
vi .workshop/settings.sh .workshop/scripts/default-settings.sh
.workshop/scripts/deploy-spawner.sh
```

The name of the deployment will be ``lab-getting-started``.

You can determine the hostname for the URL to access the workshop by running:

```
oc get route lab-getting-started
```

When the URL for the workshop is accessed you will be prompted for a user name and password. Use your email address or some other unique identifier for the user name. This is only used to ensure you get a unique session and can attach to the same session from a different browser or computer if need be. The password you must supply is ``openshift``.

Deleting the Workshop
---------------------

To delete the spawner and any active sessions, including projects, run:

```
.workshop/scripts/delete-spawner.sh
```

To delete the build configuration for the workshop image, run:

```
.workshop/scripts/delete-workshop.sh
```


Troubeleshooting
----------------

ImagePullErrors:

[source,shell]
----
oc secrets link --for=pull lab-getting-started-spawner docker-internal
----

File Permission Denied:

[source,shell]
----
oc adm policy add-scc-to-user anyuid -z lab-getting-started-spawner
----


