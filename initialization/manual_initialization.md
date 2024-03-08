# Basic Manual Initialization Steps
Document TODO:
1. Separate intialization from key generation
1. re-consider variables section
1. make this the master process file


## Prerequisites

### General
+ The files in the next paragraph all match with each other, i.e., they are for the same configuration.

#### AWS (Test/ Stage)
+ If the ECU ESN in the files has not been used before (meaning this is a freshly wiped cluster), a new EUV blob will
need to be generated. See the [EUV blob help](./euv_blob_gen.md).
+ User has permisson to access the Breakglass page, or otherwise knows the usernames and passwords necessary for this
task.
+ Some or all of the backend reset script may need to be run. Depends on what is being looked at, and what needs to be
executed.

#### E-PTES/ Lab
+ Using a terminal in the Ubuntu VM, both red and black clusters have been Fluxed using the scripts in `~/share/Init/`
+ On the Windows side, KLIF local must be started via the batch script located in `C:/EPTES/TaskScheduler/<batch_file_name>`
    - Ensure that the correct Klif version is in the file
    - Ensure that `ecuIP = 10.201.2.18`

### <a name = "cur_files"></a>Current files for this process
The user should either have these files on local storage, or have a path to them.
| Type                                 | Name                               | Notes                                                                    |
| :-----                               | :-----                             | :-----                                                                   |
| Mission Profile (MP)                 | `mission_profile.xml`              |                                                                          |
| Model image file                     | `ecu_model_img_KS-646-min.jpg`     | Optional                                                                 |
| Model property file                  | `ecu_model_property.json`          |                                                                          |
| PATS Mission Request (PMR)           | `pmr-single.xml`                   | ***Make sure start date is current date or later***                     |
| Policy file                          | `A3M_L3H_example_SPF_20211014.bin` |                                                                          |
| Production report                    | `registerECUV2.csv`                | TMLRU ESN, EUV blob                                                      |
| Satellite Access Authorization (SAA) | `saa-in-khz.json`                  | `HubName` = `CPYEP`;  ***Make sure start date is current date or later*** |

Information across files, such as start dates & ESNs, should match each other.

### Variable values
These will be needed throughout the process.
| Name          | Value             | Explanation                                                                                      |
| :-----        | :-----            | :-----------                                                                                     |
| `{tmlru_esn}` | `228700566126912` | TMLRU ESN, found in production report                                                            |
| `{jh_esn}`    | `228700566126590` | Joint Hub ESN                                                                                    |
| `{euvHex}`    | ` `               | from manufacturer; derived from                                                                  |
| `{inc_val}`   | `1`               | **Increment this** when doing repeated testing, but should remain constant through a single test |

### Breakglass page
The breakglass page is a Confluence page with table of usernames and passwords [located here](https://confluence.apps.dev.pcloud.io/pages/viewpage.action?pageId=30935941).
Access is permission limited.

### K9s background information
The information in these tables can be used to navigate K9s to find the host name for the endpoint.
+ Test cluster
    | Microservice              | Context     | Pod            | Ingress name                   | Host name                                                    |
    | :---------                | :--------   | :----          | :-------------                 | :----------                                                  |
    | KLIF UI                   | `black-tst` | `kms-flux`     | `kms-flux-klif-web-ingress`    | `klif-web-kms-flux.apps.black.tst.pcloud.io`                 |
    | Local Manager UI          | `black-tst` | `kms-flux`     | `kms-flux-tm-web-ingress`      | `tm-web-kms-flux.apps.black.tst.pcloud.io`                   |
    | POM Portal                | `red-tst`   | `mms-mpo-flux` | `vf-pom-portal-ui-ingress`     | `vf-pom-portal-ui-mms-mpo-flux.apps.red.tst.pcloud.io`       |
    | Joint Hub DS              | `red-tst`   | `mms-mpo-flux` | `joint-hub-ds-ingress`         | `joint-hub-ds-mms-mpo-flux.apps.red.tst.pcloud.io`           |
    | NE Addressing Service     | `black-tst` | `mms-mpo-flux` | `ne-addressing-svc-ingress`    | `ne-addressing-svc-mms-mpo-flux.apps.black.tst.pcloud.io`    |
    | TLE Ephemeris DS          | `black-tst` | `mms-mpo-flux` | `tle-ephemeris-ds-ingress`     | `tle-ephemeris-ds-mms-mpo-flux.apps.black.tst.pcloud.io`     |
    | Unclassified Joint Hub DS | `black-tst` | `mms-mpo-flux` | `joint-hub-unclass-ds-ingress` | `joint-hub-unclass-ds-mms-mpo-flux.apps.black.tst.pcloud.io` |

+ Stage cluster
    | Microservice              | Context     | Pod       | Ingress name                   | Host name                                             |
    | :---------                | :--------   | :----     | :-------------                 | :----------                                           |
    | KLIF UI                   | `black-stg` | `kms`     | `kms-klif-web-ingress`         | `klif-web-kms.apps.blk.stg.pcloud.io`                 |
    | Local Manager UI          | `black-stg` | `kms`     | `kms-tm-web-ingress`           | `tm-web-kms.apps.blk.stg.pcloud.io`                   |
    | POM Portal                | `red-stg`   | `mms-mpo` | `vf-pom-portal-ui-ingress`     | `vf-pom-portal-ui-mms-mpo.apps.red.stg.pcloud.io`     |
    | Joint Hub DS              | `red-stg`   | `mms-mpo` | `joint-hub-ds-ingress`         | `joint-hub-ds-mms-mpo.apps.red.stg.pcloud.io`         |
    | NE Addressing Service     | `black-stg` | `mms-mpo` | `ne-addressing-svc-ingress`    | `ne-addressing-svc-mms-mpo.apps.blk.stg.pcloud.io`    |
    | SAA Controller Service    | `red-stg`   | `mms-mpo` | `saa-svc-ingress`              | `saa-svc-mms-mpo.apps.red.stg.pcloud.io`              |
    | TLE Ephemeris DS          | `black-stg` | `mms-mpo` | `tle-ephemeris-ds-ingress`     | `tle-ephemeris-ds-mms-mpo.apps.blk.stg.pcloud.io`     |
    | Unclassified Joint Hub DS | `black-stg` | `mms-mpo` | `joint-hub-unclass-ds-ingress` | `joint-hub-unclass-ds-mms-mpo.apps.blk.stg.pcloud.io` |

### Endpoints
#### Constructing an Endpoint URL
Most (not all) endpoint URLs can be deduced from what they apply to. Use the information above, plus a little background
knowledge. For example:
| Protocol   | Microservice name      | Pod name        | "apps"          | Context                                    | Domain      |
| ---------- | ---------------------- | ----------      | --------        | ---------                                  | --------    |
| `https://` | `joint-hub-ds`         | `mms-mpo`       | `apps`          | `red-stg`                                  | `pcloud.io` |
|            | Followed by `-`        | Followed by `.` | Followed by `.` | Replace `-` with `.`, then followed by `.` |             |

RESULT: `https://joint-hub-ds-mms-mpo.apps.red.stg.pcloud.io`

If the name of the service contains `web` or `ui`, it has an interface and the URL is complete. Otherwise, the Swagger
UI path ( `/q/swagger-ui/` ) or the Mockserver dashboard path (`/mockserver/dashboard`) needs to be appended.

FINAL RESULT: `https://joint-hub-ds-mms-mpo.apps.red.stg.pcloud.io/q/swagger-ui/`

#### User Interface / Endpoint Links
[]()
+ <a name = "test_links"></a>Test
    - [KLIF UI](https://klif-web-kms-flux.apps.black.tst.pcloud.io/)
    - [Local Manager UI](https://tm-web-kms-flux.apps.black.tst.pcloud.io/)
    - [POM Portal UI](https://vf-pom-portal-ui-mms-mpo-flux.apps.red.tst.pcloud.io/)
    - [Joint Hub DS endpoint](https://joint-hub-ds-mms-mpo-flux.apps.red.tst.pcloud.io/q/swagger-ui/)
    - [NE Addressing endpoint](https://ne-addressing-svc-mms-mpo-flux.apps.black.tst.pcloud.io/q/swagger-ui/)
    - [TLE Ephemeris endpoint](https://tle-ephemeris-ds-mms-mpo-flux.apps.black.tst.pcloud.io/q/swagger-ui/)
    - [Unclassified Joint Hub DS endpoint](https://joint-hub-unclass-ds-mms-mpo-flux.apps.black.tst.pcloud.io/q/swagger-ui/)

+ <a name = "stage_links"></a>Stage - Generally speaking, these are the same minus the `-flux` part. Also, note that
Test uses `black` for URLs, where Stage uses `blk`.
    - [KLIF UI](https://klif-web-kms.apps.blk.stg.pcloud.io/)
    - [Local Manager UI](https://tm-web-kms.apps.blk.stg.pcloud.io)
    - [POM Portal UI](https://vf-pom-portal-ui-mms-mpo.apps.red.stg.pcloud.io/)
    - [Joint Hub DS endpoint](https://joint-hub-ds-mms-mpo.apps.red.stg.pcloud.io/q/swagger-ui/)
    - [NE Addressing endpoint](https://ne-addressing-svc-mms-mpo.apps.blk.stg.pcloud.io/q/swagger-ui/)
    - [SAA Controller endpoint](https://saa-svc-mms-mpo.apps.red.stg.pcloud.io/q/swagger-ui/)
    - [TLE Ephemeris endpoint](https://tle-ephemeris-ds-mms-mpo.apps.blk.stg.pcloud.io/q/swagger-ui/)
    - [Unclassified Joint Hub DS endpoint](https://joint-hub-unclass-ds-mms-mpo.apps.blk.stg.pcloud.io/q/swagger-ui/)

---

## Initialization and config file generation
Some steps will only apply to executing this procedure on the Test/Stage environment, other steps will only apply when
executing on an E-PTES string in the lab. Anything environment specific should be called out.

### Register the ECU
[TESTS-452](https://jira.apps.dev.pcloud.io/browse/TESTS-452)
+ [ ] Navigate to the POM portal  ([Test](https://vf-pom-portal-ui-mms-mpo-flux.apps.red.tst.pcloud.io/) / [Stage](https://vf-pom-portal-ui-mms-mpo.apps.red.stg.pcloud.io/))
+ NOTE: if the test cluster POM portal does not display correctly, the service may have been updated by Flux. If this is
the case, the config map will need to be updated[^1].
+ [ ] Login as 'Senior Staff' (a.k.a. `uncle.rico`) from the breakglass page.
+ [ ] In the POM portal UI, open the settings icon in upper left, look for "Manage ECU". Drag this phrase to the main
window and drop.
+ [ ] The "Manage ECU" widget will be open in the main window. In the lower left, click the "Register" icon. A "Register
ECU" widget will appear.
+ [ ] Select "Select File for Upload". A file explorer will pop up; use it to navigate to and select the relevant
Production Report file (see [current files](#cur_files))
+ [ ] Check "Yes" for the "Stop on Error?" option
+ [ ] Should now see a "Register ECU" widget verifying that file was uploaded and ECU is registered; if all is good,

close the pop-up window
+ Leave POM portal open; log out of the "Senior Staff" user.

### Upload ECU files to the KLIF services
[TESTS-2618](https://jira.apps.dev.pcloud.io/browse/TESTS-2618)
+ [ ] Navigate to the KLIF UI ([Test](https://klif-web-kms-flux.apps.black.tst.pcloud.io/) / [Stage](https://klif-web-kms.apps.blk.stg.pcloud.io/)).
+ [ ] Log in as user `admin`
+ [ ] In the upper right of the UI webpage, click on the "settings window" icon (not the "settings" icon) next to the
logged in user icon.
+ [ ] From the drop-down that appears, select "File Upoad".
+ For the following steps, refer to the [file table](#cur_files) above. The ECU model number needed can be found in the
second field of the production report.
+ [ ] Upload the policy file
    - [ ] A widget will appear. Click the "File Type" drop-down and select "Policy File".
    - [ ] Click on the paper clip icon to get a file explorer field, use it to navigate to and select the policy file,
    then click the "Submit" button.
+ [ ] Upload the model property file
    - [ ] Click again on "File Type", now select "Model Property File".
    - [ ] Enter the Model number of the ECU in the labeled field.
    - [ ] Using the file explorer field, navigate to and select the model property file, then click the "Submit" button.
+ [ ] Upload the model image file
    - [ ] Click again on "File Type", finally, select "Model Image File".
    - [ ] Enter the Model number of the ECU in the labeled field.
    - [ ] Using the file explorer field, navigate to and select the model image file, then click the "Submit" button.
+ [ ] Close the widget window and log out of the "admin" user
+ [ ] Leave the KLIF UI web page open.

### Set Network Element addressing
NOTE: This task can now be accomplished as part of the back end reset script execution using either
`stage_backend_reset.sh` or `test_backend_reset.sh`, as appropriate.

Network Element addressing needs to be set prior to initializing the TMLRU. This is a result of operation in a
development environment and will not be needed in the operational environment.
+ [ ] Navigate to the NE addressing service endpoint ([Test](https://ne-addressing-svc-mms-mpo-flux.apps.black.tst.pcloud.io/q/swagger-ui/) / [Stage](https://ne-addressing-svc-mms-mpo.apps.blk.stg.pcloud.io/q/swagger-ui/))
+ [ ] In the Test Env controller, expand `POST /test/{type}` (Note that this is "test" even in the stage cluster)
+ [ ] Set the `type` pulldown to "TMLRU"
+ [ ] Update the request body by copying and pasting the following text **OR** by comparing and updating the individual
items. `esn` and `neId` should match the contents of the file uploaded when registering the ECU.
  ```
  {
    "esn": 228700566126915,
    "neId": "228700566126915",
    "neType": "TMLRU",
    "assignedPrivAddress": {
        "mask": 32,
        "networkElementType": "TMLRU",
        "networkType": "PRIVATE",
        "oct1": 10,
        "oct2": 200,
        "oct3": 1,
        "oct4": (stage: 246, test:92)
    },
    "assignedPubAddress": {
        "mask": 24,
        "networkElementType": "TMLRU",
        "networkType": "PUBLIC",
        "oct1": 10,
        "oct2": 136,
        "oct3": 9,
        "oct4": 6
    }
  }
  ```
+ [ ] Click the "Submit" button

### Initialize the TMLRU ECU)
[TESTS-454](https://jira.apps.dev.pcloud.io/browse/TESTS-454)
+ [ ] Return to the KLIF UI ([Test](https://klif-web-kms-flux.apps.black.tst.pcloud.io/) / [Stage](https://klif-web-kms.apps.blk.stg.pcloud.io/))
+ [ ] Log in as user `klif`.
+ [ ] Test/Stage only:
    - [ ] In the upper right, next to the user name, select the Settings Window icon (not the Settings icon).
    - [ ] Select the NE ECU Simulator Settings; in the widget that appears, enter ONLY the following information, and
    select "Submit".
    | Field          | Value     |
    | :------        | :------   |
    | Ecu Type       | `TM_LRU`  |
    | ESN            | `{ne-id}` |
    | Token Required | `UNKNOWN` |
+ [ ] Enter the ECU ESN
    - [ ] Test/Stage: known from previous step
    - [ ] Lab (hardware): on device
+ The process now moves to a checklist intended to verify ECU hardware in the lab.
    - [ ] Test/Stage: check the items off of the list to advance the process.
    - [ ] Lab: inspect/verify items as directed as directed by the software widget, then check the items off of the
    list.
+ E-PTES/ Lab only:
    - [ ] Open the [TMLRU web GUI](https://10.224.106.231/login.html)
    - [ ] Login as admin from breakglass page.
    - [ ] Navigate to the ECU section of the GUI
    - [ ] On the left side of the screen, select the ECU. Then select "Start KLIF initialization".
    - "Load Policy File" will display above the initialization button.
    - [ ] Verify that Operating Mode is set to "KLIF".
+ [ ] Return to the KLIF Host UI, check "Physically zeroize the ECU", and wait until complete.
    - Test/Stage
        * [ ] Select "Next" to advance the process
    - Lab
        * [ ] Zeroize the hardware per the device procedures.
        * [ ] Load keys from SKL to TMLRU [TESTS-2597](https://jira.apps.dev.pcloud.io/browse/TESTS-2597)
        * [ ] After zeroization is complete, re-login to the TMLRU GUI. Move back to the KLIF Host UI for the next step.
+ [ ] Load Software Protection Key (SPK)
    - Test/Stage
        * [ ] Select "Next" to advance the process
    - Lab
        * [ ] Use hardware fill device to load SPK
        * [ ] Verify in TMLRU UI that a valid SPK is loaded
+ [ ] Load Policy file
    - File selector widget will appear to load the policy file.
    - [ ] Use widget to select policy file, the select "Next"
    - [ ] Lab only: Verify in TMLRU UI that a valid policy file is loaded, and that validation did not fail.
+ [ ] Load Initial Key Encryption Key (IKEK)
    - Test/Stage
        * [ ] Select "Next" to advance the process
    - Lab
        * [ ] Use hardware fill device to load IKEK
        * [ ] Verify in TMLRU UI that a valid IKEK is loaded
+ [ ] Start ECU Initialization
    - [ ] Select "Next" to advance the process
    - UI will "fast-forward" through these steps:
        * Authenticate ECU
        * Download Key Packages
        * Reset IPSEC Tunnel
+ [ ] Download PVK
    - This step pertains to verification token and does not apply to either Test/Stage or Lab environments
    - [ ] Select "Next" to advance the process
    - [ ] Lab only: On the TMLRU GUI, should see "IKEK Valid: No, PVK Valid: Yes"

-----
Start the Key Generation
-----
### Local Manager Configuration
[TESTS-4143](https://jira.apps.dev.pcloud.io/browse/TESTS-4143)
+ [ ] Navigate to the Local Manager UI ([Test](https://tm-web-kms-flux.apps.black.tst.pcloud.io/) / [Stage](https://tm-web-kms.apps.blk.stg.pcloud.io))
+ [ ] Log in as "Local Manager"
+ [ ] Endorse the registered ECUs
    - [ ] On the left side menu, click on "Endorse /De-endorse ECU" to open the page
    - [ ] Find the ECU to be endorsed, check the red/green lock symbol
        * [ ] Green: Already done, skip to re-endorsing the JH.
        * [ ] Red: Select the ECU
    - [ ] Click the "Modify Status" button to open the Endorse ECU page.
    - [ ] Read and check the boxes for the understandings
    - [ ] Set the Reason pulldown to `Reason 1`
    - [ ] Enter text for comments. Can't be blank.
    - [ ] Check the "I certify all... " box to enable the green Endorse button
    - [ ] Click the Endorse button to complete
+ [ ] Re-endorse the Joint Hub (89/90)
+ [ ] De-endorse a registered ECU
    - This is not a typical step for the overal process, but if it needs be done, see the Jira test issue linked above.

### Key Configuration Pre-Conditions
Certain items need to be set prior to initiating the key configuration. This is a result of operation in a development
environment and will not be needed in the operational environment. Most items can be accomplished by either using `curl`
commands or by the item's UI/Swagger UI. The following steps focus on the web UI/ Swagger UI method. There are separate
scripts to accomplish these tasks for Test and Stage [located here](../../initialization/).


+ All of the following non-navigation steps have these sub-steps in common.
    - At each command, the "Try it out" button must be clicked first in order to activate the editable fields
    - After fields have been edited, the "Execute" button must be clicked.
    - After the command has been executed, scroll down to find the server response code.
    - If the code is not `200`, evaluate the why and correct the issue, then re-execute.
    - The step is complete *ONLY* when a `200` server response code is received
+ [ ] Navigate to the Network Element (NE) Addressing Service endpoint ([Test](https://ne-addressing-svc-mms-mpo-flux.apps.black.tst.pcloud.io/q/swagger-ui/) / [Stage](https://ne-addressing-svc-mms-mpo.apps.blk.stg.pcloud.io/q/swagger-ui/))
+ [ ] Set the Joint Hub Core variables. NOTE: pay attention to `jhc` here!
    - [ ] Under the Addressing Controller category, expand the command for `GET /ne/jhc/address{ne-id}`.
    - [ ] For the `{ne-id}` value here, do ***NOT*** use the value above. Instead, use the `{jh_esn}`.
+ [ ] Set the Joint Hub Edge variables. NOTE: pay attention to `jhe` here!
    - [ ] Under the Addressing Controller category, expand the command for `GET /ne/jhe/address{ne-id}`.
    - [ ] For the `{ne-id}` value here, do ***NOT*** use the value above. Instead, use the `{inc_val}`.
+ [ ] Navigate to the Joint Hub DS endpoint ([Test](https://joint-hub-ds-mms-mpo-flux.apps.red.tst.pcloud.io/q/swagger-ui/) / [Stage](https://joint-hub-ds-mms-mpo.apps.red.stg.pcloud.io/q/swagger-ui/))
+ [ ] Set the variables for the Mission Planning side of the Joint Hub.
    - [ ] In the "Joint Hub Instance" section, expand the command for `POST /joint-hub`.
    - [ ] Set these items:
    | Variable     | Value       |
    | :---------   | :------     |
    | `jointHubId` | `{inc_val}` |
    | `jointHubSN` | `{jh_esn}`  |
+ [ ] Set the variables for the Mission Operations side of the Joint Hub.
    - [ ] In the "Joint Hub System" section, expand the command for `POST /jh-system`.
    - [ ] Set these items:
    | Variable   | Value                       |
    | :--------- | :------                     |
    | `esn`      | `{jh_esn}`                   |
    | `site`     | Match `HubName` in SAA file (usually `CPYEP`) |
+ [ ] Navigate to the Unclassified Joint Hub DS endpoint ([Test](https://joint-hub-unclass-ds-mms-mpo-flux.apps.black.tst.pcloud.io/q/swagger-ui/) / [Stage](https://joint-hub-unclass-ds-mms-mpo.apps.blk.stg.pcloud.io/q/swagger-ui/))
+ [ ] Update the `curl` command Request Body.
    - [ ] In the "Joint Hub System" section, expand the command for `POST /jh-system`.
    - [ ] Copy and paste the following text in place of the Request Body __OR__ find the items in this text that are different from what is visible in the UI page and update them.
    ```
    {
    "systemId": 1,
    "ecuList": [
        {
        "ecuId": null,
        "esn": 228700566126590,
        "jhcPrivateAddress": {
            "jhAddressId": null,
            "ipv4Address": "192.168.10.1",
            "ipv4AddressLen": "32"
        },
        "jhcPublicAddress": {
            "jhAddressId": null,
            "ipv4Address": "172.16.10.1",
            "ipv4AddressLen": "32"
        }
        }
    ],
    "jhePrivateAddress": {
        "jhAddressId": null,
        "ipv4Address": "172.16.10.2",
        "ipv4AddressLen": "32"
    },
    "jhePublicAddress": {
        "jhAddressId": null,
        "ipv4Address": "192.168.10.2",
        "ipv4AddressLen": "32"
    }
    }
    ```
+ [ ] Navigate to the TLE Ephemeris endpoint ([Test](https://tle-ephemeris-ds-mms-mpo-flux.apps.black.tst.pcloud.io/q/swagger-ui/) / [Stage](https://tle-ephemeris-ds-mms-mpo.apps.blk.stg.pcloud.io/q/swagger-ui/))
+ [ ] Update the TLE information
    - [ ] In the "TLE Ephemeris" section, expand the command for `PUT /tle/upload`
    - [ ] Set these items:
    | Variable    | Value                                        |
    | :---------  | :------                                      |
    | `titleName` | Name of TLE source file                      |
    | `file`      | Paste in the contents of the TLE source file |

### Key Configuration Generation
[]()
+ [ ] Return to the POM portal ([Test](https://vf-pom-portal-ui-mms-mpo-flux.apps.red.tst.pcloud.io/) / [Stage](https://vf-pom-portal-ui-mms-mpo.apps.red.stg.pcloud.io/)).
+ [ ] Log in as "Proficient Planner" (`t.durden`)
+ [ ] Import PMR [TESTS-4697](https://jira.apps.dev.pcloud.io/browse/TESTS-4697)
    - [ ] Click the settings icon in the upper left. From the menu that pops up, drag "Manage PMR" to the main window
    and drop it there to open the widget.
    - [ ] Select the "Import" icon at the lower left and use the file explorer to select the PMR file to be uploaded.
    This will open the PMR page.
    - [ ] Add or update the POC information
    | Field        | Data                  |
    | :------      | :-----                |
    | Request Type | New                   |
    | Phone Number | Formatted dummy value |
    | NIPR Email   | Formatted dummy value |
    | Organization | Dummy value           |

  If "Terminal" is applicable, the "24 Hour" and "Deployed POC" sections will contain the same field information.
    - [ ] Click the Submit button and verify that the PMR file is uploaded.
+ [ ] Import Mission Profile [TESTS-7074](https://jira.apps.dev.pcloud.io/browse/TESTS-7074)
    - [ ] Click the hamburger menu at the top left. In the drop down menu, go to `File Import > Mission Profile`
    - [ ] In the Import Mision Profile widget, select "Add File".
    - [ ] Use the file explorer dialog to select the mission profile file
    - [ ] Select "Import"
    - [ ] Verify that the widget reports a successful import.
+ [ ] Import SAA  **Do this last!**[^2]  [TESTS-7136](https://jira.apps.dev.pcloud.io/browse/TESTS-7136)
    - [ ] Click the settings icon in the upper left. From the menu that pops up, drag "Manage SAA" to the main window
    and drop it there to open the widget.
    - [ ] Select the "Import" icon at the lower left and use the file explorer to select the SAA file to be uploaded.
    - [ ] In the file explorer dialog, select the SAA file to be uploaded.
    - [ ] Verify the displayed contents are correct.
    - [ ] Click the "Submit" button. Verify the file is shown on the "Manage SAA" window.
    NOTE: The file may or may not show. A bug has been submitted to the UI team.
    - [ ] Navigate to the [SAA endpoint swagger](https://saa-svc-mms-mpo-flux.apps.red.tst.pcloud.io/q/swagger-ui) page,
    - [ ] Access `POST /saa/{id}/accept`, enter the `<SAAID>` from the SAA that was imported, look for a `200` return code
    - [ ] return to the POM portal and verify that the Manage SAA window shows "Accepted"

### Key Generation Verification
+ To track that files are being generated
    - Context `red-stg` or `red-tst`
    - Namespace `mms-mpo` or `mms-mpo-flux`
    - Pod `secret-file-generator-svc-*` and open/watch the log file
    - Look for lines that say `x of 12` have been generated. `12 of 12` will never appear, but check that there is some
    output after number 11.
+ Output key gen files are located in:
    - Context `black-stg` or `black-tst`
    - Namespace `nms` or `nms-flux`
    - Shell into pod `nms-config-download-*`
    - Files are located at `/var/nms/`
        + Should contain folders `cm/ne`, `mo_dropbox`, and `staging`.
        + Correct operation should have everything (except session reports and transfer reports) in subfolder `valid`
        inside `staging`. A subfolder `invalid` may also exist, but indicates a problem.

---
## Footnotes
---
[^1]: In K9s, execute the following steps:
1. `red-tst` context
1. `mms-mpo-flux` pod
1. `:configmap` to get the list of config maps, scroll down to `vf-pom-portal-ui`, `e` to edit
1. find the `PLUGIN_SERVER` variable, and pre-pend "mms-" to the top level domain name
1. save & quit with `:wq!`
1. `:pods` to return to the pods list, scroll down to `vf-pom-portal-ui-***`
1. `Ctrl-d` to delete (stop and re-start) the pod
1. After the new pod is running, return to browser and refresh the page.

[^2]: The key generation process will self-start when the SAA import is successful, regardless of status of the PMR or
MP import. Mitigate this by ensuring it is the last thing imported.
