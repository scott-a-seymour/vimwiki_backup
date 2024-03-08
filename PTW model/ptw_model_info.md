## Data Plane
* Changing the BMC (burst mode, modulation, coding) is updated by a listener.
* __Section 2.3.6__ might have an example of decoding?
* Simulates the physical layer processing chain for PTS waveform
* Adds in simulated real-world effects, like band noise and distortion
* Receive chain outputs ethernet packets
* Because it doesn't upconvert to RF, doesn't simulate freq hopping
* Each class does 1 step of the processing, basically 1 block of a block diagram.

## TRANSEC
* Self contained and can run independently of the data plane.
* `MessageProtection` class has encrypt/ decrypt functionality
* Uses 3 crypto functions:
  * AES-256 for keystream gen & encryption
    * Uses the update Java 7 referenced in [ptw model info](ptw_reqs.md)
  * SHA-384 for session keys
  * Galios/Counter Mode (GCM) for auth

## Questions

3. Where are the keys and t-files in the Kubernetes clusters?
  * I know the process sends TRANSEC tables to KMS for encoding... where does KMS put them?
  * What about the keys? How & where are they generated?

## Decoder ring
Need to figure out which files "go together"

### group 1 JH
hex s/n: A00080700004
dec s/n: 175924015267844
A00080700004_IKEK.dat
PRO_JH175924015267844_Session1686608275390.bkpg

pull "kms_nonce" out of "ap_log_kmx_06_12_23jhecu.txt" and b64 decode it
then find "ecu_init_decrypt_auth_resp" and get the next instance of "plain_text" after that
load the IKEK file



