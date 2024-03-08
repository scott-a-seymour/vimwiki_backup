# Branch switching on a cluster in GitLab

## Before starting
* [ ] Ensure you have a cert in the path below for `--ca-file`
* [ ] Ensure you have Personal Access Token (PAT) for GitLab access to each repository
  * May have to copy-paste it, if so, it will not be visible.
| cluster         | GitLab PAT                 | BitBucket PAT |
| :-----          | :-----                     |               |
| black/red demo  | glpat-tHJdjATpgcdkFMn_gWkJ |               |
| black/red test  |                            |               |
| black/red stage |                            |               |
| black lwt1      |                            |               |
| red lwt1        |                            |               |
| black lwt2      |                            |               |
| red lwt2        |                            |               |


## Available contexts
| Red Clusters | Black Clusters | Other Clusters |
| :-----       | :-----         | :-----         |
| red-demo     | black-demo     | bigtimber-dev  |
| red-dev      | black-dev      | jh-dev         |
| red-lwt1     | black-lwt1     | jha            |
| red-lwt2     | black-lwt2     | jhb            |
| red-stg      | black-stg      | jhc            |
| red-tst      | black-tst      |                |

## Flux the black side
Confluence reference page [here](https://confluence.apps.dev.pcloud.io/display/PTESDOPSD/Using+Flux)
* [ ] Set your context to `black-<cluster>`
* `--path` is the context to be changed; This implies you will have to run this separately on red and black sides.
* `--branch` is the branch name to switch to
* `--repository` is the repo name as displayed in GitLab
* [ ] Run this command with appropriate edits. As shown below, it is set to go back to `PTESMMS-5789-updating-nm-portal-ui` on `black-demo`
`flux bootstrap gitlab \
    --registry=artifactory.apps.dev.pcloud.io/devops-docker-ext/ghcr.io/fluxcd \
    --image-pull-secret=pull-secret \
    --owner=gitops \
    --hostname=gitlab.pcloud.io \
    --token-auth \
    --ca-file=/usr/local/share/ca-certificates/pcloud/pcloudADca.crt \
    --repository=aws_clusters \
    --path=black-demo \
    --branch develop
    `

## Flux the red side
* [ ] Switch context to `red-<cluster>`
* [ ] Same command as above, but switch the path from black to red

PAT for gitlab access
glpat-tHJdjATpgcdkFMn_gWkJ


