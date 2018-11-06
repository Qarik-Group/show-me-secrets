# Spring Music for Kubernetes Service Catalog

To deploy the sample Ruby/Sinatra application with a service instance/binding from your Service Catalog:

```shell
helm upgrade --install show-me-secrets . \
    --set "database.service.class=cleardb,database.service.plan=spark"
```

In the example above, it is assumed that your Service Catalog has a service class "cleardb" with a service plan "spark".

To run Spring Music without a database service instnace/binding:

```shell
helm upgrade --install show-me-secrets . \
    --set "database.service.class=null"
```

## Clean up

To remove the sample application:

```shell
helm delete --purge show-me-secrets
```