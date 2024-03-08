# Locally Configured Items
| Alias             | What It Does                                  |
| :---              | :---                                          |
| `k`               | `kubectl`                                     |
| `kgp`             | `k get pods` Lists pods in current namespace. |
| `k_list_contexts` | `kubectl config get-contexts`                 |

| Function                          | What It Does                                                                                                           |
| :---                              | :---                                                                                                                   |
| `k_bash`                          | Open up an interactive bash shell with a given generically named pod                                                   |
| `k_busy_logs`                     | Tail the last 20 logs of a given pod with follow set to false.                                                         |
| `k_cm <config map>`               | Grab a `<config map>`                                                                                                  |
| `k_context [<context>]`           | Switch to `<context >` if provided, list the active context otherwise.                                                 |
| `k_describe_pod <pod name>`       | `kubectl describe pod <pod name>`.                                                                                     |
| `k_down`                          | Scale a given deployment to 0                                                                                          |
| `k_edit_cm <config map>`          | Edit `<config map>`                                                                                                    |
| `k_get_node`                      | Get the node port of a given pod                                                                                       |
| `k_kill_pod <pod name>`           | `kubectl delete pod <pod name> --grace-period=0 --force`                                                               |
| `k_logs <pod name>`               | Follow (display) logs for `<pod name>`                                                                                 |
| `k_namespace [<namespace>]`       | Switch to `<namespace >` if provided, list the active namespace otherwise                                              |
| `k_overrides <helm_release_name>` | `helm get values "<helm_release_name>"`
| `k_pods`                          | Get pods in a namespace                                                                                                |
| `k_status`                        | `watch -t kubectl get pods -o custom-columns="NAME:metadata.name,STATUS:status.phase" --sort-by=.metadata.name`        |
| `k_toggle`                        | Scale a given pod to 0 replicas and then back up to 1.                                                                 |
| `k_up`                            | Scale a given deployment to 1                                                                                          |
| `ktl <time>`                      | Grab all pod logs from the active namespace. The `<time>` is an integer followed by "h", "m", or "s", and is required. |

| Command                                                  | What It Does                                              |
| :---                                                     | :---                                                      |
| `k cp <namespace>/<pod>:<path to source> <path to dest>` | Copy files and folders from a pod to local space          |
| `k logs <pod name> > <destination name>`                 | Copy snapshot of log for `pod name` to `destination name` |

---
---
# kubectl commands
kubectl is a command line utility to control the Kubernetes cluster manager.

Find more information at [kubernetes.io](https://kubernetes.io/docs/reference/kubectl/)

---
## Usage
` kubectl [flags] [options] `
+ `kubectl <command> --help` for more information about a given command.
+ `kubectl options` for a list of global command-line options ([see below](#global-command-options) for results).
---

## Basic Commands (Beginner):
| Command    | Action                                                                                              |
| :--------  | :--------                                                                                           |
| ` create ` | Create a resource from a file or from stdin                                                         |
| ` expose ` | Take a replication controller, service, deployment or pod and expose it as a new Kubernetes service |
| ` run    ` | Run a particular image on the cluster                                                               |
| ` set    ` | Set specific features on objects                                                                    |

## Basic Commands (Intermediate):
| Command     | Action                                                                                         |
| :--------   | :--------                                                                                      |
| ` explain ` | Get documentation for a resource                                                               |
| ` get     ` | Display one or many resources                                                                  |
| ` edit    ` | Edit a resource on the server                                                                  |
| ` delete  ` | Delete resources by file names, stdin, resources and names, or by resources and label selector |

## Deploy Commands:
| Command       | Action                                                                        |
| :--------     | :--------                                                                     |
| ` rollout   ` | Manage the rollout of a resource                                              |
| ` scale     ` | Set a new size for a deployment, replica set, or replication controller       |
| ` autoscale ` | Auto-scale a deployment, replica set, stateful set, or replication controller |

## Cluster Management Commands:
| Command           | Action                                    |
| :--------         | :--------                                 |
| ` certificate   ` | Modify certificate resources              |
| ` cluster-info  ` | Display cluster information               |
| ` top           ` | Display resource (CPU/memory) usage       |
| ` cordon        ` | Mark node as unschedulable                |
| ` uncordon      ` | Mark node as schedulable                  |
| ` drain         ` | Drain node in preparation for maintenance |
| ` taint         ` | Update the taints on one or more nodes    |

## Troubleshooting and Debugging Commands:
| Command           | Action                                                            |
| :--------         | :--------                                                         |
| ` describe      ` | Show details of a specific resource or group of resources         |
| ` logs          ` | Print the logs for a container in a pod                           |
| ` attach        ` | Attach to a running container                                     |
| ` exec          ` | Execute a command in a container                                  |
| ` port-forward  ` | Forward one or more local ports to a pod                          |
| ` proxy         ` | Run a proxy to the Kubernetes API server                          |
| ` cp            ` | Copy files and directories to and from containers                 |
| ` auth          ` | Inspect authorization                                             |
| ` debug         ` | Create debugging sessions for troubleshooting workloads and nodes |
| ` events        ` | List events                                                       |

## Advanced Commands:
| Command        | Action                                                               |
| :--------      | :--------                                                            |
| ` diff       ` | Diff the live version against a would-be applied version             |
| ` apply      ` | Apply a configuration to a resource by file name or stdin            |
| ` patch      ` | Update fields of a resource                                          |
| ` replace    ` | Replace a resource by file name or stdin                             |
| ` wait       ` | Experimental: Wait for a specific condition on one or many resources |
| ` kustomize  ` | Build a kustomization target from a directory or URL                 |

## Settings Commands:
| Command         | Action                                                                                |
| :--------       | :--------                                                                             |
| ` label       ` | Update the labels on a resource                                                       |
| ` annotate    ` | Update the annotations on a resource                                                  |
| ` completion  ` | Output shell completion code for the specified shell (bash, zsh, fish, or powershell) |

## Other Commands:
| Command           | Action                                                                         |
| :--------         | :--------                                                                      |
| ` api-resources ` | Print the supported API resources on the server                                |
| ` api-versions  ` | Print the supported API versions on the server, in the form of "group/version" |
| ` config        ` | Modify kubeconfig files                                                        |
| ` plugin        ` | Provides utilities for interacting with plugins                                |
| ` version       ` | Print the client and server version information                                |

---

## Global Command Options
This is the output of the `kubectl options` command above. These can be appended to any of the preceding commands.
| Command                              | Meaning                                                                                                                                                                                           |
| :--------                            | :---------                                                                                                                                                                                        |
| `--as=''                           ` | Username to impersonate for the operation. User could be a regular user or a service account in a namespace.                                                                                      |
| `--as-group=[]                     ` | Group to impersonate for the operation, this flag can be repeated to specify multiple groups.                                                                                                     |
| `--as-uid=''                       ` | UID to impersonate for the operation.                                                                                                                                                             |
| `--cache-dir=''                    ` | Default cache directory                                                                                                                                                                           |
| `--certificate-authority=''        ` | Path to a cert file for the certificate authority                                                                                                                                                 |
| `--client-certificate=''           ` | Path to a client certificate file for TLS                                                                                                                                                         |
| `--client-key=''                   ` | Path to a client key file for TLS                                                                                                                                                                 |
| `--cluster=''                      ` | The name of the kubeconfig cluster to use                                                                                                                                                         |
| `--context=''                      ` | The name of the kubeconfig context to use                                                                                                                                                         |
| `--disable-compression=false       ` | If true, opt-out of response compression for all requests to the server                                                                                                                           |
| `--insecure-skip-tls-verify=false  ` | If true, the server's certificate will not be checked for validity. This will make your HTTPS connections insecure                                                                                |
| `--kubeconfig=''                   ` | Path to the kubeconfig file to use for CLI requests.                                                                                                                                              |
| `--log-flush-frequency=5s          ` | Maximum number of seconds between log flushes                                                                                                                                                     |
| `--match-server-version=false      ` | Require server version to match client version                                                                                                                                                    |
| `-n, --namespace=''                ` | If present, the namespace scope for this CLI request                                                                                                                                              |
| `--password=''                     ` | Password for basic authentication to the API server                                                                                                                                               |
| `--profile='none'                  ` | Name of profile to capture. One of (none &#124 cpu &#124 heap &#124 goroutine &#124 threadcreate &#124 block &#124 mutex)                                                                         |
| `--profile-output='profile.pprof'  ` | Name of the file to write the profile to                                                                                                                                                          |
| `--request-timeout='0'             ` | The length of time to wait before giving up on a single server request. Non-zero values should contain a corresponding time unit (e.g. 1s, 2m, 3h). A value of zero means don't timeout requests. |
| `-s, --server=''                   ` | The address and port of the Kubernetes API server                                                                                                                                                 |
| `--tls-server-name=''              ` | Server name to use for server certificate validation. If it is not provided, the hostname used to contact the server is used                                                                      |
| `--token=''                        ` | Bearer token for authentication to the API server                                                                                                                                                 |
| `--user=''                         ` | The name of the kubeconfig user to use                                                                                                                                                            |
| `--username=''                     ` | Username for basic authentication to the API server                                                                                                                                               |
| `-v, --v=0                         ` | number for the log level verbosity                                                                                                                                                                |
| `--vmodule=                        ` | comma-separated list of pattern=N settings for file-filtered logging (only works for the default text log format)                                                                                 |
| `--warnings-as-errors=false        ` | Treat warnings received from the server as errors and exit with a non-zero exit code                                                                                                              |

