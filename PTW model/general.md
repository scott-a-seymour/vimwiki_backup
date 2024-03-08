[TODO link](../todo/mms.md)

# Goal
To be able to look at the encrypted TRANSEC files that come out of KMS, so that I&T can compare them to what was input.

This is meant to be a troubleshooting tool for downstream components; if they are having issues, we can check and see
if it's a GIGO problem.

## Raw EUVs
Set by manufacturer, cannot change, ever, unless they tell us.
These values are in hex, so prepend `0x` as needed.

All JHs have one value for raw euv: `4649584544455556464958454445555646495845444555564649584544455556`
All TMLRUs have one value for raw euv: `F111111111111111111111111111111111111111111111111111111111111111`


## Misc
simulator crashes, stepping through to find out what's what.

Seems to be looking for a DK file (.dpkg) to fill in info. Need to figure out where to plug it in, may be in place of current .bkpg file.
  Update: subbing a .dpkg file in place of the .bkpg didn't work. Code is looking for the file extension.


Found the DK (from Joe):
  After loading the kpg file, need to move it to the correct part of the struct.
  ```matlab
  obj.keys.DK = kp.keys(1)
  ```

After run:
looking for data found in
  ```matlab
  obj.tables.TPT.contents.HopPairs(<1 to n>)
  ```


