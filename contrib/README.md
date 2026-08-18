# contrib — project vocabs shared across Signals

SHARE-tier SKOS that is **not** the core SDG scheme (`vocabulary/`).
Gaius publishes model-native feature schemes here so Aegir, Atelier, and
Signals can consume the same pin.

| path | scheme | identity |
|------|--------|----------|
| `clt/qwen3-1.7b-20k/` | Bluelight CLT activations | `(layer, feature_idx)` |
| `sae/` (later) | SAE activations | same row shape, `model=sae` |

These schemes stay **distinct** from `https://signals.zndx.org/sdg/scheme`.
Cross-links, when earned, are `skos:relatedMatch` / `skos:closeMatch` — never
`skos:broader` into BFO/CCO.

Concepts graduate candidate → confirmed. Do not mint unused features.
