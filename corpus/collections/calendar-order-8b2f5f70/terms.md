# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Calendar Order
- **genus**: `cco:ont00000995`
- **definition**: A commercial transaction record for the procurement of promotional flip-style calendars.
- **attributes**: orderReference, orderDate, unitPrice, setupFee, totalQuantity, status, submissionDeadline
- **relations**: orderedBy→BusinessClient, containsTheme→CalendarTheme, containsAdCopy→AdCopy, includesLogo→CorporateLogo

## Business Client
- **genus**: `cco:ont00000995`
- **definition**: A commercial entity or individual submitting an order for promotional materials.
- **attributes**: businessName, contactName, membershipStatus, emailAddress, faxNumber, websiteUrl
- **relations**: placesOrder→CalendarOrder, providesAdCopy→AdCopy

## Calendar Theme
- **genus**: `cco:ont00000995`
- **definition**: A specific visual design category for the calendar, such as automotive or regional scenery.
- **attributes**: themeName, category, previewUrl
- **relations**: hasOrder→CalendarOrder

## Ad Copy
- **genus**: `cco:ont00000995`
- **definition**: The specific text and branding content printed on the calendar's advertisement area.
- **attributes**: copyAreaDimensions, printColor, language, imprintSource
- **relations**: belongs_to_order→CalendarOrder, provided_by→BusinessClient, features_logo→CorporateLogo

## Corporate Logo
- **genus**: `cco:ont00000995`
- **definition**: A graphical mark or design representing a business, used in the calendar's ad area.
- **attributes**: logoType, vendor
- **relations**: attached_to_order→CalendarOrder, included_in_ad→AdCopy
