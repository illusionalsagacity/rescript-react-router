/**
Props for the Await component.
- `resolve`: Promise to wait for
- `children`: Render function receiving the resolved value
- `errorElement`: Element to render if the promise rejects
*/
type props<'resolved> = {
  resolve: Promise.t<'resolved>,
  children: 'resolved => React.element, // could also be a React.element
  errorElement?: React.element,
}

/**
Component for handling async data with Suspense-like behavior.
Waits for a promise to resolve before rendering children.
Use inside Suspense boundaries with loader data.
*/
@module("react-router-dom")
external make: React.component<props<'resolved>> = "Await"
