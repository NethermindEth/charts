# Helm Chart for DLC Attestor

This Helm chart deploys the DLC Attestor application with customizable settings for replica count, image configuration, security, affinity, monitoring, and more. The deployment supports various blockchain networks for attestation purposes.

## Values Configuration

### Global Values

| Parameter               | Description                                          | Default                                         |
|-------------------------|------------------------------------------------------|-------------------------------------------------|
| `global.replicaCount`   | Number of replicas to deploy                         | `1`                                             |
| `global.image.repository` | Container image repository                          | `public.ecr.aws/dlc-link/dlc-attestor`          |
| `global.image.tag`      | Container image tag                                  | `v1.5.4-testnet`                                |
| `global.image.imagePullPolicy` | Image pull policy                              | `IfNotPresent`                                  |
| `global.externalSecrets.enabled` | Enable external secrets integration          | `true`                                          |
| `global.externalSecrets.secretStoreRef` | External secret store reference name   | `secretStoreRef`                                |
| `global.serviceAccount.create` | Create a service account                       | `false`                                         |
| `global.imagePullSecrets` | Secrets to use for pulling images                  | `artifactory-general-secret`                    |
| `global.nodeSelector`   | Node selector for pod assignment                     | `{k8s.scaleway.com/pool-name: workloads-pool-nl-ams-2, beta.kubernetes.io/instance-type: PLAY2-MICRO}` |
| `global.tolerations`    | Tolerations for pod assignment                       | `{}`                                            |
| `global.affinity`       | Affinity rules for pod assignment                    | `{}`                                            |
| `global.sessionAffinity.enabled` | Enable session affinity                      | `false`                                         |
| `global.sessionAffinity.timeoutSeconds` | Session duration (in seconds)         | `86400`                                         |
| `global.healthProbe.consensus.livenessProbe` | Liveness probe configuration      | `{}`                                            |
| `global.healthProbe.consensus.readinessProbe` | Readiness probe configuration    | `{}`                                            |
| `global.service.svcHeadless` | Create headless service                         | `false`                                         |
| `global.service.type`   | Service type                                         | `ClusterIP`                                     |
| `global.service.externalTrafficPolicy` | External traffic policy                 | `Cluster`                                       |
| `global.service.Ports`  | Ports exposed by the service                         | See [Service Ports](#service-ports)             |

### ConfigMap Configuration

The `configMap.config` section specifies key-value pairs for configuring the DLC attestor application. The configuration is templated and includes environment-specific variables like `ATTESTOR_NAME`, `BITCOIN_CORE_RPC_ENDPOINT`, and more.

### Environment Variables

Define container environment variables under the `env` section:

| Name                     | Description                                        | Example Value                                  |
|--------------------------|---------------------------------------------------|-----------------------------------------------|
| `ATTESTOR_NAME`          | Name of the attestor                               | `nethermind`                                  |

### Monitoring

The `metrics` section allows configuring monitoring with Prometheus through a `ServiceMonitor`.

| Parameter               | Description                                          | Default                                         |
|-------------------------|------------------------------------------------------|-------------------------------------------------|
| `metrics.enabled`       | Enable metrics scraping                              | `true`                                          |
| `metrics.serviceMonitor.interval` | Scrape interval                            | `30s`                                           |
| `metrics.serviceMonitor.honorLabels` | Whether to honor metric labels          | `false`                                         |

### Service Ports

The application exposes multiple service ports:

| Port Name                      | Port Number | Protocol      |
|--------------------------------|-------------|---------------|
| `ATTESTOR_BACKEND_PORT`        | `8811`      | `TCP`         |
| `BLOCKCHAIN_INTERFACE_PORT`    | `8801`      | `TCP`         |

### Miscellaneous

Additional Kubernetes objects can be specified using `extraObjects`.

---
