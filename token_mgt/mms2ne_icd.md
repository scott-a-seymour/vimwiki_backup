# MMS to NE ICD

--------------------------------------------------------------------------------
Document: PATS-13820 MMS to NE ICD Rev E, 3 Dec 2021

XML docs -> config files; sent via HTTPS, push/ pull inititated via SNMP

DefID structure:
| MMS to NE | Interface Type | Sequence # | Notes                          |
| :-----:   | :-----:        | :-----:    | :-----:                        |
| `MTN`     | `I`            | `XXXX`     | I = interface between MMS & NE |
| `MTN`     | `M`            | `XXXX`     | M = initiated/ action from MMS |
| `MTN`     | `N`            | `XXXX`     | N = inititated/ action from NE |

These DefID are found throughout the document.

## Message file formats

#### Common format
| field name        | data type | length (octets) | encryption | field definition                                      |
| -----             | -----     | -----           | -----      | -----                                                 |
| command type      | enum      | 1               | none       | `2` = ECU software image file (ESIF) receipt ack      |
|                   |           |                 |            | `3` = ECU log upload                                  |
|                   |           |                 |            | `4` = ECU log reception ack                           |
| version           | int       | 1               | none       | version num -> indicates format of remaining fields   |
|                   |           |                 |            | this is version 0                                     |
| ecu id            | int       | 2               | none       | unique id of ecu sending this log                     |
| date              | oct str   | 4               | AES-GCM    | 15-0: year                                            |
|                   |           |                 |            | 23-16: month                                          |
|                   |           |                 |            | 31-17: day (set by crypto midnight)                   |
| command seq #     | int       | 1               | AES-GCM    | strictly increasing sequence number for this ecu id - |
|                   |           |                 |            | command type pair; reset @ crypto midnight            |

    This space contains the unique parts below.

| field name        | data type | length (octets) | encryption | field definition                                      |
| -----             | -----     | -----           | -----      | -----                                                 |
| init vector       | oct str   | 12              | none       | AES-GCM IV                                            |
| authenticaion tag | oct str   | 16              | none       | AES-GCM integrity check value (ICV)                   |

----------------------------------------

#### [ECU](ECU) software image file receipt ack
Unique part:
| field name    | data type | length (octets) | encryption | field definition                   |
| -----         | -----     | -----           | -----      | -----                              |
| command seq # | int       | 1               | AES-GCM    | Null (all zeros)                   |
| result code   | enum      | 1               | AES-GCM    | 7: Error: File ID fail             |
|               |           |                 |            | 6: Error: authenticaion tag fail   |
|               |           |                 |            | 5: Error: NSA signature fail       |
|               |           |                 |            | 4: Error: SW image decryption fail |
|               |           |                 |            | 3: Error: SW image execute fail    |
|               |           |                 |            | 0: Success                         |
|               |           |                 |            | All other values reserved          |

----------------------------------------

#### ECU log upload
Unique parts:
| field name      | data type | length (octets) | encryption | field definition              |
| -----           | -----     | -----           | -----      | -----                         |
| log data length | int       | 4               | AES-GCM    | length (octets) of next field |
| log data        | oct str   | N               | AES-GCM    | binary log data               |
|                 |           |                 |            |                               |

----------------------------------------

#### ECU log reception ack
Unique part:
| field name  | data type | length (octets) | encryption | field definition                |
| -----       | -----     | -----           | -----      | -----                           |
| result code | enum      | 1               | AES-GCM    | 7: Error authenticaion tag fail |
|             |           |                 |            | 6: Error: Unexpected command    |
|             |           |                 |            | 5: Error: File parsing fail     |
|             |           |                 |            | 0: Successful upload            |
|             |           |                 |            | All other values reserved       |


----------------------------------------

## Configuration (of the NEs) Management
Config file status attributes: {{{Downloaded} Effective} Active}
One and only one manifest currently active at any point in time.
