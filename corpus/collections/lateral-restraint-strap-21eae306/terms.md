# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Lateral Restraint Strap
- **genus**: `cco:ont00000995`
- **definition**: A manufactured metal strap used to provide lateral restraint between concrete floors and masonry walls, featuring one or two turn-down ends for anchoring.
- **attributes**: strapIdentifier, minimumLength, gauge, material, turnDownConfiguration, maxSpacingAlongWall
- **relations**: restrains→MasonryWall, anchoredTo→FloorAssembly, fixedBy→FixingMethod

## Masonry Wall
- **genus**: `bfo:0000040`
- **definition**: A structural wall constructed from masonry units such as concrete blocks or bricks, serving as the restrained element in lateral restraint systems.
- **attributes**: wallIdentifier, wallHeight, wallType, masonryUnitType, structuralRole
- **relations**: restrainedBy→LateralRestraintStrap, adjacentTo→FloorAssembly

## Floor Assembly
- **genus**: `bfo:0000040`
- **definition**: A constructed floor system, such as beam and block or precast/pre-stressed concrete planks, into which lateral restraint straps are anchored.
- **attributes**: assemblyIdentifier, assemblyType, infillMaterial, toleranceLevel, floorHeight
- **relations**: anchors→LateralRestraintStrap, supports→MasonryWall

## Fixing Method
- **genus**: `bfo:0000015`
- **definition**: A prescribed procedure for securing lateral restraint straps to floor assemblies using screws and plastic plugs, specified by material type and spacing.
- **attributes**: methodIdentifier, screwLength, screwGauge, plugType, screwSpacing, minScrewsPerStrap, appliesToMaterial
- **relations**: secures→LateralRestraintStrap, appliesTo→FloorAssembly
