# espresso

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart that combines Kubernetes manifests and scripts to deploy Espresso Sequencer AVS nodes.

**Homepage:** <https://docs.espressosys.com/sequencer>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| matilote |  |  |
| AntiD2ta |  |  |

## Requirements

Kubernetes: `^1.23.0-0`

| Repository | Name | Version |
|------------|------|---------|
| file://../common | common | 1.0.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| externalSecrets.enabled | bool | `false` |  |
| externalSecrets.secretStoreRef.kind | string | `"SecretStore"` |  |
| externalSecrets.secretStoreRef.name | string | `"secretStoreRef"` |  |
| fullnameOverride | string | `""` | Provide a name to substitute for the full names of resources |
| global.namespaceOverride | string | `""` |  |
| global.persistence | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"size":"150Gi","storageClassName":""}` | Whether or not to allocate persistent volume disk for the data directory. In case of node failure, the node data directory will still persist.  |
| global.serviceAccount | object | `{"annotations":{},"create":false}` | Service account ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/espressosystems/espresso-sequencer/sequencer"` |  |
| image.tag | string | `"main"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` | Hostnames. Can be provided if Ingress is enabled.  |
| ingress.ingressClassName | string | `""` |  |
| ingress.labels | object | `{}` |  |
| ingress.paths | list | `[]` | Paths to use for ingress rules By default, the Service created by this chart is used as the target Service for the Ingress. If not defined the following default object will be used: - path: "/"   port: 8000   pathType: "ImplementationSpecific"   serviceName: "<common.names.fullname>"  |
| ingress.routePrefix | string | `"/"` | Route Prefix. Can skip it if any item of path has the path defined. |
| ingress.tls | list | `[]` | TLS configuration for Ingress Secret must be manually created in the namespace  |
| initImage | object | `{"pullPolicy":"IfNotPresent","repository":"bitnami/kubectl","tag":"1.28"}` | Init image is used to manage which secrets the pod should use. |
| keystoreCLI | object | `{"db":{"host":"","secretId":"","user":""},"image":{"pullPolicy":"IfNotPresent","repository":"nethermindeth/espresso-keystore-cli","tag":"v0.1.1"},"projectId":"","pv":{"secretId":""}}` | Keystore-CLI settings. Used to manage keys on Secret Store. |
| nodes.da.command[0] | string | `"sequencer"` |  |
| nodes.da.command[10] | string | `"query"` |  |
| nodes.da.command[1] | string | `"--"` |  |
| nodes.da.command[2] | string | `"storage-sql"` |  |
| nodes.da.command[3] | string | `"--"` |  |
| nodes.da.command[4] | string | `"http"` |  |
| nodes.da.command[5] | string | `"--"` |  |
| nodes.da.command[6] | string | `"catchup"` |  |
| nodes.da.command[7] | string | `"--"` |  |
| nodes.da.command[8] | string | `"status"` |  |
| nodes.da.command[9] | string | `"--"` |  |
| nodes.da.externalSecrets.data | list | `[]` |  |
| nodes.da.replicaCount | int | `0` |  |
| nodes.da.resources.requests.memory | string | `"12000Mi"` |  |
| nodes.da.sqlStorage | bool | `true` |  |
| nodes.da.volumeMount | bool | `false` |  |
| nodes.normal.command[0] | string | `"sequencer"` |  |
| nodes.normal.command[1] | string | `"--"` |  |
| nodes.normal.command[2] | string | `"http"` |  |
| nodes.normal.command[3] | string | `"--"` |  |
| nodes.normal.command[4] | string | `"catchup"` |  |
| nodes.normal.command[5] | string | `"--"` |  |
| nodes.normal.command[6] | string | `"status"` |  |
| nodes.normal.externalSecrets.data | list | `[]` |  |
| nodes.normal.replicaCount | int | `1` |  |
| nodes.normal.resources.requests.memory | string | `"12000Mi"` |  |
| nodes.normal.sqlStorage | bool | `false` |  |
| nodes.normal.volumeMount | bool | `true` |  |
| nodes_config.ESPRESSO_SEQUENCER_API_PORT | int | `80` |  |
| nodes_config.ESPRESSO_SEQUENCER_BASE_FEE | int | `0` |  |
| nodes_config.ESPRESSO_SEQUENCER_CDN_ENDPOINT | string | `"cdn.cappuccino.testnet.espresso.network:1737"` |  |
| nodes_config.ESPRESSO_SEQUENCER_CHAIN_ID | int | `0` |  |
| nodes_config.ESPRESSO_SEQUENCER_L1_PROVIDER | string | `""` |  |
| nodes_config.ESPRESSO_SEQUENCER_MAX_BLOCK_SIZE | string | `"30000000"` |  |
| nodes_config.ESPRESSO_SEQUENCER_ORCHESTRATOR_URL | string | `"https://orchestrator.cappuccino.testnet.espresso.network"` |  |
| nodes_config.ESPRESSO_SEQUENCER_STATE_PEERS | string | `"https://query.cappuccino.testnet.espresso.network"` |  |
| nodes_config.ESPRESSO_SEQUENCER_STORAGE_PATH | string | `"/mount/sequencer/store/"` |  |
| nodes_config.ESPRESSO_STATE_RELAY_SERVER_URL | string | `"https://state-relay.cappuccino.testnet.espresso.network"` |  |
| nodes_config.RUST_LOG | string | `"warn,libp2p=off"` |  |
| nodes_config.RUST_LOG_FORMAT | string | `"json"` |  |
| rbac.create | bool | `true` |  |
| rbac.name | string | `""` | The name of the role to use. If not set and create is true, a name is generated using the fullname template  |
| rbac.rules | list | `[{"apiGroups":[""],"resources":["secrets"],"verbs":["create","get","list","watch","delete"]}]` | Required Role rules |
| rbac.rules[0] | object | `{"apiGroups":[""],"resources":["secrets"],"verbs":["create","get","list","watch","delete"]}` | Required to create Sequencer env Secret.  |
| service.svcAnnotations | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount | object | `{"annotations":{},"name":""}` | Service account ref: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.13.1](https://github.com/norwoodj/helm-docs/releases/v1.13.1)
