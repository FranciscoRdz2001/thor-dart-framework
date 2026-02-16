/// In Flutter, MainAxisSize controls whether a Row/Column fills all
/// available space (max) or shrinks to fit its children (min).
///
/// CSS mapping:
///   Row  + min → width: fit-content
///   Column + min → height: fit-content
///   max → default block/flex behavior (no extra CSS needed)
enum MainAxisSize { min, max }
