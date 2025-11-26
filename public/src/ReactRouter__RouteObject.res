/**
Arguments passed to route loader functions.
- `params`: Dynamic route parameters (e.g., ":id" segments)
- `request`: The Fetch Request object for the navigation
*/
type loaderArgs = {
  params: Dict.t<string>,
  request: Fetch.Request.t,
}

/**
Arguments passed to route action functions.
- `params`: Dynamic route parameters (e.g., ":id" segments)
- `request`: The Fetch Request object containing form data
*/
type actionArgs = {
  params: Dict.t<string>,
  request: Fetch.Request.t,
}

/**
Route object configuration for data routers (createBrowserRouter, etc.).

Use this to define routes with loaders, actions, error handling, and lazy loading.

Fields:
- `id`: Unique identifier for the route (required)
- `path`: URL path pattern (optional for index routes)
- `index`: Set to true for index routes (renders when parent path matches exactly)
- `element`: React element to render when the route matches
- `errorElement`: React element to render when the route throws an error
- `loader`: Async function to load data before rendering
- `action`: Async function to handle form submissions
- `children`: Nested child routes
- `caseSensitive`: Whether path matching is case-sensitive
- `hydrateFallbackElement`: Element to show during hydration
- `handle`: Custom data accessible via useMatches
- `shouldRevalidate`: Control when loaders re-run
- `lazy_`: Function returning a promise for code-splitting
*/
@unboxed
type rec t =
  | Route({
      id: string,
      caseSensitive?: bool,
      children?: array<t>,
      element?: React.element,
      index?: bool,
      path?: string,
      loader?: loaderArgs => promise<'loaderResponse>,
      action?: actionArgs => promise<'actionResponse>,
      errorElement?: React.element,
      hydrateFallbackElement?: React.element,
      handle?: 'handle,
      shouldRevalidate?: bool,
      @as("lazy") lazy_?: unit => promise<unknown>,
    }): t
