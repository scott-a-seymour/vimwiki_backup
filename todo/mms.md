# HIGH Priority

# MEDIUM Priority
## Current Jira issues
### [PTESMMS-5835](https://jira.apps.dev.pcloud.io/browse/PTESMMS-5835) Re-start ETPES-1
2024-02-29
* [X] Connect w/ Mike Doloff re: rebuild EPTES-1
  * He will get corrections made to EPTES-3 instance, then will use that as a baseline image
* Created Jira task
* [ ] Complete install process by following Mike D's written instructions
* [X] Follow up with DSO about access to JHs from AWS
  * [X] Need it to be able to move log files from EPTES-1 to AWS
  * Referred to DSO MM by Mike D
  * [X] Submit request to DSO for access to all JHs
  * [X] Access complete

### [PTESMMS-5731](https://jira.apps.dev.pcloud.io/browse/PTESMMS-5731) Python script for key generation
- Notes for next steps from Joe K:
  - [ ] Initialize a JH ECU
  - [ ] Run through the PMR -> SAR -> Config gen process flow
  - [ ] Export the config set (keys, TRANSEC, KMX log) from MITLL sim
  - [X] Verify the keys can be decrypted
  - [X] Verify the TRANSEC can be decrypted
  - [ ] Verify we have all the PTW keys
        - [ ] FHK
        - [X] GHK
        - [ ] PGHK
        - [X] CGHK
        - [ ] TPK
        - [ ] SCCK
        - [ ] All effectivity times match the SAA

### [PTESBDM-149](https://jira.apps.dev.pcloud.io/browse/PTESBDM-149) In demo, NM portal can get to SL-1
* Not assigned to me, but see below
* Check if my recent update to nm-portal-ui fixed this issue; there is now an override for the url, but turn it off/ on to see if the problem still exists
  - [ ] check if it works with default URL
  - [ ] check if it works with re-direct to `tm-web-` URL
  - 2024-02-23 check web UI:
    1. Did not re-direct to the `tm-web-*` UI
    2. Manually navigated to `tm-web-*`; login button gets a `200` response, but nothing loads, it just stays  on the login page.
    3. So as of right now, not able to see if this bug still exists.
  - 2024-03-01 Re-checked web UI; no change

### [PTESBDM-108](https://jira.apps.dev.pcloud.io/browse/PTESBDM-108) Config File Generation halts after Key Package Generation
* Not assigned to me, but see below
- [ ] Follow up with Kevin McLean about PTESBDM-108


## Other


# LOW Priority
2024-02-22
- [ ] Set up weekly 'version sync' meeting with other teams
  - [ ] MMS UI Pablo
  - [ ] MMS MP Mike Lingk
  - [ ] MMS MO Mike Lingk
  - [ ] KMS Alexandria/ Caleb/ Jinque
  - [ ] NMS Minh Nguyen




-----------------------------------------------------------------------------------------------------------------------
# Completed

-----------------------------------------------------------------------------------------------------------------------
## HIGH
2024-03-07 17:10
* [X] re-try pin & token with `UKMS_HOST` changed from `kms-klif-ukms` to `ukms`
  * [X] Instruction from Minh, try this first:
    1. Get ingress URL for `ukms` pod
    2. Shell into `upload-response` pod
    3. `curl` to see if `upload-response` can reach the `ukms` ingress
  * prob in black configmap, maybe in black helm chart
  * afterwards, run `flux suspend hr` then `flux resume hr`
  * COMPLETE: worked for the specific problem I had, process is now failing at a new step; KLIF team working with us

2024-03-07 17:08
OBE - Cancelled
* [ ] Demo the P&T process for sprint Demo
  * [ ] SKL out and on
  * [ ] Keys loaded in TMRLU
  * [ ] token out and ready?

2024-02-28 14:20
* [X] Ask Dave about URL re-direct for MMS-5789: verify that this is a mitigation for a bug.

2024-02-23 15:41
- [X] Update kube config. Download new info from each cluster on Rancher using the button in the upper right, edit my local file.


## MEDIUM
2024-03-05
### [PTESMMS-5630](https://jira.apps.dev.pcloud.io/browse/PTESMMS-5630) PTW Simulator training (Matlab decryption stuff)
  * Notes are located [here](../PTW model/general)
  * 2024-03-05: Akash rejected the task at PO review because he wanted files attached, so I did that.

2024-03-01
### [PTESMMS-5730](https://jira.apps.dev.pcloud.io/browse/PTESMMS-5730) Learn pin and token process
- [X] Training w/ Akash in lab
  - Got new policy file from Rudolph
  - Klif hangs on trying to create a token
    * Bug created: [PTESBDM-160](https://jira.apps.dev.pcloud.io/browse/PTESBDM-160)
- Tried again with configmap updates suggested by KMS/KLIF dev Scott G; same results.
- 2024-03-05: Akash rejected at PO review, wanted logs attached. Done.

2024-02-29
### PTESMMS-5450 MMS-NE ICD XML training
  * Notes are [here](../token_mgt/mms2ne_icd.md)
  * [X] Check out XSDs and XMLs in Bitbucket


2024-02-26 09:43
- Updated Flux IAW Jansen's instructions
2024-02-28 14:21
* PTESMMS-5789 MMS UI update
  - [X] Test
  - [X] Demo
  - [X] Stage
        Attach output artifacts to Jira issue

## LOW



