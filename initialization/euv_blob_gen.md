# EUV Blob Generation

Initializing the ECU requires a new ECU blob value for each unique ECU ESN. There are 2 ways to accomplish this, via a
shell in K9s, or via in the Rancher UI.

## The curl command
You will need the to know the following information:
| Variable   | Value                                                                | Information                                                     |
| :--------- | :------                                                              | :------------                                                   |
| `ecuEsn`   | in production report                                                 | Numeric integer value in decimal form; provided by manufacturer |
| `euvHex`   | `0xF111111111111111111111111111111111111111111111111111111111111111` | Provided by manufacturer                                        |


Then, substitute those values into this command:

`curl -d '{"ecuEsn": <Value>, "euvHex":"<Value>"}' \
-H 'Content-Type: application/json' \
http://localhost:9191/exportEuvBlob`

The command will return a string value to copy and past into the production report. If working in a pod shell, keep the
command all on one line.

## K9s method
  - [ ] Go to the `red-stg` context.
  - [ ] If in the Test cluster, go to the `kms-flux` pod.
  - [ ] If in the Stage cluster, go to the `kms` pod.
  - [ ] Select the `kms-ecu-simulator-*` microservice. Press `s` to shell into the microservice.
  - [ ] Execute the curl command above. It will return an alpha-numeric string.
  - [ ] Copy the string.
  - [ ] Open the production report file in a text editor.
  - [ ] Paste the value in the appropriate field, save and quit.

## Rancher UI method
TODO: fill in this section
