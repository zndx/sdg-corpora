# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Custom Back Assembly
- **genus**: `cco:ont00000995`
- **definition**: A manufactured wheelchair back component configured with specific dimensions, air cell placements, and adjustable compartments to meet a client's postural and pressure-relief needs.
- **attributes**: assemblyId, shellWidth, shellHeight, shellDepth, status, orderReference, manufactureLeadTime
- **relations**: contains→AirCellPlacement, configuredWith→AirCompartment, orderedBy→ProviderAccount

## Air Cell Placement
- **genus**: `cco:ont00000995`
- **definition**: A specific location and type of air cell installed within the custom back assembly shell grid to provide targeted pressure relief.
- **attributes**: cellId, profileType, widthCm, heightCm, gridRow, gridColumn
- **relations**: partOf→CustomBackAssembly

## Air Compartment
- **genus**: `cco:ont00000995`
- **definition**: A distinct zone of interconnected air cells within the back assembly that can be inflated or deflated together via a shared valve.
- **attributes**: compartmentId, compartmentName, isAdjustable, valveLocation
- **relations**: contains→AirCellPlacement, partOf→CustomBackAssembly

## Provider Account
- **genus**: `cco:ont00000995`
- **definition**: The business or clinical entity account holding the order, including contact details and billing information.
- **attributes**: accountNumber, providerName, addressLine1, addressLine2, city, state, zipCode, country, phone, email
- **relations**: placed→CustomBackAssembly

## Manufacturing Order
- **genus**: `cco:ont00000995`
- **definition**: The formal request record generated to initiate the production of a custom back assembly, linking the order to the provider and the assembly specifications.
- **attributes**: orderNumber, orderDate, orderType, poNumber, specialInstructions
- **relations**: specifies→CustomBackAssembly, submittedBy→ProviderAccount
