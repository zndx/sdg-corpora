# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Amateur Radio Station
- **genus**: `cco:ont00000995`
- **definition**: A physical or logical amateur radio station identified by a unique call sign and SSID used for communication with LignoSat.
- **attributes**: callSign, ssid, locationQth, regionQra, status
- **relations**: transmitsTo→LignoSatUplinkSignal, receivesCertificateFrom→CommunicationCertificate

## LignoSat Uplink Signal
- **genus**: `bfo:0000015`
- **definition**: An FM packet transmission from an amateur radio station to LignoSat containing call sign and message data.
- **attributes**: signalId, timestamp, frequency, protocolVersion, messageContent
- **relations**: originatesFrom→AmateurRadioStation, processedBy→LignoSat, containsMessage→ExtractedMessage

## LignoSat Satellite
- **genus**: `cco:ont00000995`
- **definition**: A satellite platform that receives amateur radio uplink signals, extracts call signs and messages, and transmits CW downlink responses.
- **attributes**: satelliteId, orbitType, memoryCapacity, downlinkMode, status
- **relations**: receivesUplinkFrom→LignoSatUplinkSignal, transmitsDownlinkTo→LignoSatDownlinkSignal, storesMessagesIn→MessageStorage

## LignoSat Downlink Signal
- **genus**: `bfo:0000015`
- **definition**: A CW or FM packet transmission from LignoSat to amateur radio stations containing call signs and collected message data.
- **attributes**: downlinkId, timestamp, downlinkType, callSignsIncluded, messageCount
- **relations**: transmittedBy→LignoSat, receivedBy→AmateurRadioStation, deliversMessagesTo→ExtractedMessage

## Extracted Message
- **genus**: `cco:ont00000995`
- **definition**: A message (e.g., QTH, QRA) extracted from an uplink signal and temporarily stored in LignoSat's memory.
- **attributes**: messageId, messageType, content, extractionTimestamp, storageStatus
- **relations**: extractedFromUplink→LignoSatUplinkSignal, storedInSatellite→LignoSat, collectedViaDownlink→LignoSatDownlinkSignal

## Communication Certificate
- **genus**: `cco:ont00000995`
- **definition**: A digital certificate issued to an amateur radio station upon successful communication with LignoSat.
- **attributes**: certificateId, issueDate, validUntil, communicationType, status
- **relations**: issuedToStation→AmateurRadioStation, linkedToUplink→LignoSatUplinkSignal
