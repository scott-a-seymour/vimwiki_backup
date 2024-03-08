# Initial Matlab requirements
* [X] Matlab 2016b or higher
* [ ] Coded Modulation Library (CML): Supports FEC of the waveform
  * [ ] External download from [Univ of West Virginia](https://wcrl.csee.wvu.edu/wiki/Coded_Modulation_Library)
  * [ ] Unzip this into `<ptw model root>/cml` (where ... is the root dir of the ptw model)
* [ ] Java crypto extension (export controlled item, not included w/ basic Matlab) for crypto algorithms used by TRANSEC
  * [ ] Inside Matlab, can check for Java 7 or higher using `version -java`.
    * The result `Java 1.7.0_<something>` indicates Java 7.
  * [ ] Download from [Oracle](http://www.oracle.com/technetwork/java/javase/downloads/jce-7-download-432124.html)
  * [ ] Extract 2 relevant files, to `<matlab root>/sys/java/jre/win64/jre/lib/security/`
    * `US_export_policy.jar` & `local_policy.jar`
    * Can find `<matlab root>` with command `matlabroot` in the Matlab console
    * `win64` in the path can be changed to `maci64` or `glnxa64` if appropriate


