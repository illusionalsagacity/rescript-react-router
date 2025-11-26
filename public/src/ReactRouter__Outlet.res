/**
Props for the Outlet component.
- `context`: Optional context value accessible to child routes via useOutletContext
*/
type props<'ctx> = {context?: 'ctx}

/**
Renders the matching child route element.
Place this in parent route elements where nested content should appear.
Pass a context prop to share data with child routes.
*/
@module("react-router-dom")
external make: React.component<props<'ctx>> = "Outlet"
