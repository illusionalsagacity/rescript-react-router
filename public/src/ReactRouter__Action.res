/**
History action type indicating how the navigation occurred.
- `Pop`: Browser back/forward navigation (user pressed back/forward button)
- `Push`: New entry added to history stack (typical navigation)
- `Replace`: Current entry replaced in history stack (redirect)
*/
type t = | @as("POP") Pop | @as("PUSH") Push | @as("REPLACE") Replace
