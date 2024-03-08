# TMLRU initialization

Process is similar to [manual initialization](initialization/manual_initialization), but has a couple of additional steps.
As noted in the EPTES/Lab section:
  1. Black and red need to be fluxed.
  2. In the black NMS configmap (`eptes-b/apps/nms/configmap-nms.yaml`), change <an IP address>.
  3. TMLRU UI (Chrome window on the Windows side), log in as admin and put the TMLRU in KLIF mode
    * Click `MMS` in the left side, to bring up the interface, then click the `Start KLIF` button.
  5. Manuall start Klif-local by double-clicking in the Windows file explorer
Additionally, a different policy file needs to be used, this enables pin & token.
