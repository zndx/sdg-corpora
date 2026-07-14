# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Inventory Item
- **genus**: `cco:ont00000995`
- **definition**: A discrete physical good, such as a diamond, piece of jewelry, or antique radio, tracked within the wholesale inventory system.
- **attributes**: sku, itemType, quantityOnHand, unitCost, locationCode, status
- **relations**: storedIn→WarehouseLocation, shippedVia→ShipmentRecord

## Shipment Record
- **genus**: `cco:ont00000995`
- **definition**: A logistical event recording the outbound movement of inventory items to a customer or distributor.
- **attributes**: trackingNumber, shipmentDate, carrierName, totalWeight, shippingMethod, status
- **relations**: containsItem→InventoryItem, destinedFor→CustomerAccount

## Customer Account
- **genus**: `cco:ont00000995`
- **definition**: A persistent record of a business client, including contact details and transaction history for the wholesale operation.
- **attributes**: customerID, companyName, contactEmail, creditLimit, accountStatus, registrationDate
- **relations**: placedOrder→ShipmentRecord, associatedWith→MarketingCampaign

## Marketing Campaign
- **genus**: `bfo:0000015`
- **definition**: A coordinated business activity designed to promote products, manage customer service programs, and drive sales revenue.
- **attributes**: campaignID, campaignName, startDate, endDate, budget, channel, status
- **relations**: targetsCustomer→CustomerAccount, promotesItem→InventoryItem

## Database Record
- **genus**: `cco:ont00000958`
- **definition**: A structured digital entry within the inventory or customer management system, representing a snapshot of business data.
- **attributes**: recordID, tableName, lastModified, modifiedBy, recordHash, isDuplicate
- **relations**: representsEntity→InventoryItem, representsEntity→CustomerAccount
