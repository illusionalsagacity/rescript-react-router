/**
History action type indicating how the navigation occurred.
- `Pop`: Browser back/forward navigation
- `Push`: New entry added to history stack
- `Replace`: Current entry replaced in history stack
*/
module Action = ReactRouter__Action

/**
Component for handling async data in routes with Suspense-like behavior.
Use with loaders that return promises.
*/
module Await = ReactRouter__Await

/**
Browser history implementation for single-page applications.
*/
module BrowserHistory = ReactRouter__BrowserHistory

/**
Router component that uses the browser's History API for navigation.
Best for web applications that will be deployed to a server that handles
dynamic requests.
*/
module BrowserRouter = ReactRouter__BrowserRouter

/**
Factory for creating static routers for server-side rendering.
*/
module CreateStaticRouter = ReactRouter__CreateStaticRouter

/**
Configuration for custom data loading strategies.
*/
module DataStrategy = ReactRouter__DataStrategy

/**
Fetcher instance returned by `useFetcher` for non-navigation data mutations.
Allows submitting forms and loading data without changing the URL.
*/
module Fetcher = ReactRouter__Fetcher

/**
Form component that handles client-side form submissions with data routers.
Submissions trigger route actions and integrate with navigation state.
*/
module Form = ReactRouter__Form

/**
Configuration options for future React Router features.
*/
module FutureConfig = ReactRouter__FutureConfig

/**
Router that uses the hash portion of the URL for routing.
Useful for static file servers that can't handle dynamic URLs.
*/
module HashRouter = ReactRouter__HashRouter

/**
Core history interface used by all routers.
*/
module History = ReactRouter__History

/**
Navigational link component that renders an `<a>` element.
Handles client-side navigation without full page reloads.
*/
module Link = ReactRouter__Link

/**
Location object representing the current URL state.
Includes pathname, search, hash, state, and a unique key.
*/
module Location = ReactRouter__Location

/**
In-memory history implementation for testing and non-browser environments.
*/
module MemoryHistory = ReactRouter__MemoryHistory

/**
Router that keeps history in memory. Useful for tests and non-browser environments.
*/
module MemoryRouter = ReactRouter__MemoryRouter

/**
Component that programmatically navigates to a new location when rendered.
Useful for redirects in render logic.
*/
module Navigate = ReactRouter__Navigate

/**
Options for programmatic navigation via `useNavigate` or `<Navigate>`.
*/
module NavigateOptions = ReactRouter__NavigateOptions

/**
Current navigation state including loading/submitting status and form data.
Accessed via `useNavigation` hook.
*/
module NavigationState = ReactRouter__NavigationState

/**
Special version of `Link` that knows whether it's "active" or "pending".
Useful for building navigation menus and tabs.
*/
module NavLink = ReactRouter__NavLink

/**
Renders child route elements. Use in parent routes to display nested content.
*/
module Outlet = ReactRouter__Outlet

/**
Partial location object for navigation, may omit some fields.
*/
module PartialLocation = ReactRouter__PartialLocation

/**
Partial path object with optional pathname, search, and hash.
*/
module PartialPath = ReactRouter__PartialPath

/**
Complete path object with pathname, search, and hash strings.
*/
module Path = ReactRouter__Path

/**
Result of a path matching operation.
*/
module PathMatch = ReactRouter__PathMatch

/**
Pattern specification for path matching.
*/
module PathPattern = ReactRouter__PathPattern

/**
Public fetcher interface without internal methods.
*/
module PublicFetcher = ReactRouter__PublicFetcher

/**
Specifies whether paths should be resolved relative to the route hierarchy or the URL pathname.
- `Route`: Relative to route hierarchy
- `Path`: Relative to URL pathname
*/
module RelativeRoutingType = ReactRouter__RelativeRoutingType

/**
Internal router instance type returned by `createBrowserRouter`, etc.
*/
module RemixRouter = ReactRouter__RemixRouter

/**
Match object from `matchRoutes` containing route and params.
*/
module RouteMatch = ReactRouter__RouteMatch

/**
Route object configuration for data routers.
Supports loaders, actions, error elements, and lazy loading.
*/
module RouteObject = ReactRouter__RouteObject

/**
Top-level component that provides routing context for data routers.
Pass the router instance created by `createBrowserRouter`, etc.
*/
module RouterProvider = ReactRouter__RouterProvider

/**
Component-based route definition for use with `<Routes>`.
*/
module Route = ReactRouter__Route

/**
Container for `<Route>` components. Renders the first matching route.
*/
module Routes = ReactRouter__Routes

/**
Component that manages scroll position restoration on navigation.
*/
module ScrollRestoration = ReactRouter__ScrollRestoration

/**
Handler for server-side data fetching with static routers.
*/
module StaticHandler = ReactRouter__StaticHandler

/**
Router for server-side rendering without browser APIs.
*/
module StaticRouter = ReactRouter__StaticRouter

/**
Provider component for static router context in SSR.
*/
module StaticRouterProvider = ReactRouter__StaticRouterProvider

/**
Union type for string or location object parameters.
*/
module StringOrLocation = ReactRouter__StringOrLocation

/**
Target destination for navigation.
Can be a string path or a partial path object.

## Examples
```rescript
// String path
ReactRouter.To.String("/dashboard")

// Path object with search params
ReactRouter.To.Path({pathname: "/search", search: "?q=hello"})
```
*/
module To = ReactRouter__To

/**
Match information from `useMatches` including route id, params, and handle.
*/
module UIMatch = ReactRouter__UIMatch

/**
History update event containing action and location.
*/
module Update = ReactRouter__Update

/**
URL parsing utilities.
*/
module Url = ReactRouter__Url

/**
View transition component for animating route changes.
*/
module ViewTransition = ReactRouter__ViewTransition

/**
Listener callback type for history changes.
*/
type listener<'state> = ReactRouter__Update.t<'state> => unit

// #region Routers

/**
Options for creating a memory router.
- `basename`: Base path for all routes
- `future`: Feature flags for upcoming React Router features
- `initialEntries`: Array of initial history entries
- `initialIndex`: Initial index in the history stack
*/
type memoryRouterOptions<'state> = {
  basename?: string,
  future?: FutureConfig.t,
  initialEntries?: array<StringOrLocation.t<'state>>,
  initialIndex?: int,
}

/**
Create a memory router for testing or non-browser environments.
Pass routes and optionally set initialEntries for starting location.
*/
@module("react-router-dom")
external createMemoryRouter: (
  array<ReactRouter__RouteObject.t>,
  ~options: memoryRouterOptions<'state>=?,
) => RemixRouter.t = "createMemoryRouter"

// #endregion

// #region BrowserRouter
/**
Options for creating a browser router.
- `basename`: Base URL for all routes (e.g., "/app")
- `hydrationData`: Data for hydrating server-rendered content
- `dataStrategy`: Custom data loading strategy
- `window`: Custom window object (useful for iframes)
*/
type browserRouterOptions<'hydrationData> = {
  basename?: string,
  hydrationData?: 'hydrationData,
  dataStrategy?: ReactRouter__DataStrategy.t,
  window?: Dom.window,
}

/**
Create a browser router for client-side routing.
This is the recommended router for web applications.
Pass an array of RouteObject.t and optional options.
*/
@module("react-router-dom")
external createBrowserRouter: (
  array<ReactRouter__RouteObject.t>,
  ~options: browserRouterOptions<'hydrationData>=?,
) => RemixRouter.t = "createBrowserRouter"
// #endregion

// #region HashRouter
/**
Options for creating a hash router.
*/
type hashRouterOptions<'state> = {
  basename?: string,
  future?: ReactRouter__FutureConfig.t,
  window?: Dom.window,
}

/**
Create a hash router that uses the URL hash for routing.
Useful when you can't configure your server to handle all URLs.
URLs will look like: example.com/#/dashboard
*/
@module("react-router-dom")
external createHashRouter: (
  array<ReactRouter__RouteObject.t>,
  ~options: hashRouterOptions<'state>=?,
) => RemixRouter.t = "createHashRouter"

// #endregion

// #region StaticRouter

type staticRouterOptions<'state> = {
  basename?: string,
  location: StringOrLocation.t<'state>,
  future?: ReactRouter__FutureConfig.t,
  window?: Dom.window,
}

/**
Create a static router for server-side rendering.
Use with StaticRouterProvider for SSR.
*/
@module("react-router-dom")
external createStaticRouter: (
  array<ReactRouter__RouteObject.t>,
  ~context: unknown,
  ~options: staticRouterOptions<'state>,
) => RemixRouter.t = "createStaticRouter"
// #endregion

// #endregion
// #region Utilities

/**
Creates a URL path string from a PartialPath object.
Combines pathname, search, and hash into a single string.
*/
@module("react-router-dom")
external createPath: PartialPath.t => string = "createPath"

/**
Parses a URL path string into a PartialPath object.
Extracts pathname, search, and hash components.
*/
@module("react-router-dom")
external parsePath: string => PartialPath.t = "parsePath"

/**
Matches a location against an array of route objects.
Returns an array of matches if found, useful for SSR data loading.
*/
@module("react-router-dom")
external matchRoutes: (
  array<ReactRouter__RouteObject.t>,
  StringOrLocation.t<'state>,
  ~basename: string=?,
) => array<RouteMatch.t<'data>> = "matchRoutes"

/**
Tests if a path pattern matches a given pathname.
Returns a PathMatch with params if matched.
*/
@module("react-router-dom")
external matchPath: (PathPattern.t, string) => PathMatch.t = "matchPath"

/**
Resolves a To destination to an absolute Path.
*/
@module("react-router-dom")
external resolvePath: (To.t, ~fromPathname: string=?) => Path.t = "resolvePath"

/**
Resolves a To destination against route matches and a basename.
*/
@module("react-router-dom")
external resolveTo: (To.t, array<string>, string) => Path.t = "resolveTo"

/**
Extracts the pathname from a To destination if present.
*/
@module("react-router-dom")
external getToPathname: To.t => option<string> = "getToPathname"

/**
Removes the basename prefix from a pathname.
*/
@module("react-router-dom")
external stripBasename: (string, string) => string = "stripBasename"

// #region Fetch utilities

type response
// TODO: json

type responseInit = {status?: int, statusText?: string}

/**
Creates a redirect response for use in loaders/actions.
Redirects the user to a new URL.
*/
@module("react-router-dom")
external redirect: (string, ~options: responseInit=?) => response = "redirect"

/**
Creates a redirect response that forces a full document reload.
Use when you need to ensure fresh server data.
*/
@module("react-router-dom")
external redirectDocument: (string, ~options: responseInit=?) => response = "redirectDocument"

/**
Creates a redirect response that replaces the current history entry.
*/
@module("react-router-dom")
external replace: (string, ~options: responseInit=?) => response = "replace"

// #endregion

// #endregion
// #region Hooks

/**
Returns the data from the most recently completed action.
Returns None if no action has been submitted yet.
*/
@module("react-router-dom")
external useActionData: unit => option<'actionData> = "useActionData"

/**
Returns the error thrown in an async function passed to Await.
Use inside the error boundary for Await components.
*/
@module("react-router-dom")
external useAsyncError: unit => option<Error.t> = "useAsyncError"

/**
Returns the resolved value from the parent Await component.
Use inside the render prop children of Await.
*/
@module("react-router-dom")
external useAsyncValue: unit => option<'asyncValue> = "useAsyncValue"

/**
Registers a callback to run before the page unloads.
Useful for saving data or warning users about unsaved changes.
*/
@module("react-router-dom")
external useBeforeUnload: (unit => 'return) => unit = "useBeforeUnload"

type useHrefOptions = {relative?: RelativeRoutingType.t}

type blockerFunctionArgs<'oldState, 'newState> = {
  currentLocation: Location.t<'oldState>,
  nextLocation: Location.t<'newState>,
  action: ReactRouter__Action.t,
}
type blockerFunction<'oldState, 'newState> = blockerFunctionArgs<'oldState, 'newState> => bool

@unboxed
type blockCondition<'oldState, 'newState> = Bool(bool) | Fn(blockerFunction<'oldState, 'newState>)

/**
Blocker state returned by useBlocker.
- `Unblocked`: Navigation is allowed
- `Blocked`: Navigation is blocked, call proceed() to continue or reset() to cancel
- `Proceeding`: User chose to proceed, navigation is in progress
*/
@tag("state")
type blocker<'oldState, 'newState> =
  | @as("unblocked") Unblocked
  | @as("blocked")
  Blocked({
      reset: unit => unit,
      proceed: unit => unit,
      location: Location.t<'oldState>,
    })
  | @as("proceeding") Proceeding({location: Location.t<'newState>})

/**
Block navigation away from the current route.
Useful for preventing users from losing unsaved changes.
Pass Bool(true) to always block, or Fn(args => bool) for conditional blocking.
*/
@module("react-router-dom")
external useBlocker: blockCondition<'oldState, 'newState> => blocker<'oldState, 'newState> =
  "useBlocker"

/**
Returns the href string for a given To destination.
Useful for creating custom link components.
*/
@module("react-router-dom")
external useHref: (To.t, ~options: useHrefOptions=?) => string = "useHref"

/**
Returns true if the component is rendered inside a Router context.
*/
@module("react-router-dom")
external useInRouterContext: unit => bool = "useInRouterContext"

/**
Returns the current Location object containing pathname, search, hash, state, and key.
Re-renders when the location changes.
*/
@module("react-router-dom")
external useLocation: unit => Location.t<'state> = "useLocation"

type linkClickHandlerOptionsOptions = {relative?: RelativeRoutingType.t}
type linkClickHandlerOptions<'state> = {
  target?: string,
  replace?: bool,
  state?: 'state,
  options?: linkClickHandlerOptionsOptions,
}

/**
Returns a click handler for custom link components.
Handles client-side navigation on click events.
*/
@module("react-router-dom")
external useLinkClickHandler: (
  To.t,
  ~options: linkClickHandlerOptions<'state>=?,
  ReactEvent.Mouse.t,
) => unit = "useLinkClickHandler"

/**
Returns the current navigation state.
Use to show loading indicators during navigation.
- `state`: "idle", "loading", or "submitting"
- `location`: The location being navigated to
- `formData`, `json`, `text`: Submission data if submitting a form
*/
@module("react-router-dom")
external useNavigation: unit => NavigationState.t<'locationState> = "useNavigation"

/**
Returns the type of the current navigation action: Pop, Push, or Replace.
*/
@module("react-router-dom")
external useNavigationType: unit => Action.t = "useNavigationType"

/**
Returns a PathMatch if the given pattern matches the current URL.
Use to conditionally render based on the current route.
*/
@module("react-router-dom")
external useMatch: @unwrap [#Path(Path.t) | #Pattern(PathPattern.t)] => PathMatch.t = "useMatch"

/**
Returns an array of all active route matches.
Useful for building breadcrumbs or accessing parent route data.
*/
@module("react-router-dom")
external useMatches: unit => array<UIMatch.t> = "useMatches"

/**
Returns a navigate function for programmatic navigation.
Call with a To destination and optional NavigateOptions.

```rescript
let navigate = ReactRouter.useNavigate()

navigate(ReactRouter.To.String("/dashboard"), ~options={replace: true})
```
*/
@module("react-router-dom")
external useNavigate: (unit, To.t, ~options: NavigateOptions.t<'state>=?) => unit = "useNavigate"

/**
Returns the child route element, or None if no child route matched.
*/
@module("react-router-dom")
@return(nullable)
external useOutlet: unit => option<React.element> = "useOutlet"

/**
Returns the context value passed to the parent Outlet component.
Use for sharing data between parent and child routes.
*/
@module("react-router-dom")
external useOutletContext: unit => 'context = "useOutletContext"

/**
Returns a Dict of URL parameters from the current route.
Parameter names match the dynamic segments in your route path (e.g., ":id").
*/
@module("react-router-dom")
external useParams: unit => Dict.t<string> = "useParams"

type blockFunction<'oldState, 'newState> = (
  Location.t<'oldState>,
  Location.t<'newState>,
  Action.t,
) => bool
@unboxed
type whenCondition<'oldState, 'newState> = Bool(bool) | Fn(blockFunction<'oldState, 'newState>)
type usePromptOptions<'oldState, 'newState> = {
  @as("when") when_?: whenCondition<'oldState, 'newState>,
  message?: string,
}

/**
Shows a browser prompt before navigating away.
Unstable API - may change in future versions.
*/
@module("react-router-dom")
external unstable_usePrompt: usePromptOptions<'oldState, 'newState> => unit = "unstable_usePrompt"

/**
Resolves a To destination relative to the current location.
Returns the absolute Path.
*/
@module("react-router-dom")
external useResolvedPath: (To.t, ~options: useHrefOptions=?) => Path.t = "useResolvedPath"

type useViewTransitionStateOptions = {relative?: RelativeRoutingType.t}

/**
Returns true if a view transition is currently active for the given To destination.
*/
@module("react-router-dom")
external useViewTransitionState: (To.t, ~options: useViewTransitionStateOptions=?) => bool =
  "useViewTransitionState"

/**
Renders the matching routes from the provided route config.
Alternative to using Route and Routes components.
*/
@module("react-router-dom")
external useRoutes: (
  array<ReactRouter__RouteObject.t>,
  ~location: StringOrLocation.t<'state>=?,
) => array<RouteMatch.t<'data>> = "useRoutes"

type revalidatorState = | @as("idle") Idle | @as("loading") Loading

/**
Revalidator for manually triggering route data revalidation.
*/
type revalidator = {state: revalidatorState, revalidate: unit => unit}

/**
Returns a revalidator object for manually triggering data revalidation.
Call revalidate() to re-run all active loaders.
*/
@module("react-router-dom")
external useRevalidator: unit => revalidator = "useRevalidator"

/**
Returns the data from the current route's loader function.
Note: The return type is not type-safe - cast to your expected type.
*/
@module("react-router-dom")
external useLoaderData: unit => 'loaderData = "useLoaderData"

/**
Returns the error thrown by the nearest route error boundary.
Use in errorElement components to display error information.
*/
@module("react-router-dom")
external useRouteError: unit => 'a = "useRouteError"

// @module("react-router-dom")
// external useRouteLoaderData: (
//   @ignore RouteObject2.route<'loaderData, _, _>,
//   string,
// ) => 'loaderData = "useRouteLoaderData"
// let useRouteLoaderData = route => useRouteLoaderData(route, route.id)

/**
Initial value types for useSearchParams.
*/
@unboxed
type urlSearchParamsInit = String(string) | KeyValuePair((string, string)) | Dict(Dict.t<string>)

/**
Returns the current URL search params and a function to update them.
Similar to React.useState but synced with the URL.
*/
@module("react-router-dom")
external useSearchParams: (~init: urlSearchParamsInit) => 'a = "useSearchParams"

type useFormActionOptions = {relative?: RelativeRoutingType.t}

/**
Returns the action URL for a form, resolved relative to the current route.
*/
@module("react-router-dom")
external useFormAction: (~action: string=?, ~options: useFormActionOptions=?) => string =
  "useFormAction"

type fetcherOptions = {key?: string}

/**
Returns a Fetcher for making data mutations without navigation.
Use for "background" submissions that don't change the URL.
The fetcher has its own independent state for tracking loading/submission.
*/
@module("react-router-dom")
external useFetcher: fetcherOptions => ReactRouter__Fetcher.t<'state> = "useFetcher"

/**
Returns an array of all active fetchers in the application.
Useful for showing global loading indicators.
*/
@module("react-router-dom")
external useFetchers: unit => array<PublicFetcher.t> = "useFetchers"

type submittable = Element(Dom.element)

type formData
type urlSearchParams

/**
Options for programmatic form submission via useSubmit.
*/
type submitOptions<'state> = {
  method?: string,
  encType?: string,
  fetcherKey?: string,
  navigate?: bool,
  preventScrollReset?: bool,
  relative?: RelativeRoutingType.t,
  replace?: bool,
  state?: 'state,
  viewTransition?: bool,
  flushSync?: bool,
}

/**
Returns a function to programmatically submit forms.
Can submit form elements, FormData, URLSearchParams, or JSON data.
*/
@module("react-router-dom")
external useSubmit: @unwrap (
  [#Element(Dom.element) | #FormData(formData) | #URLSearchParams(urlSearchParams) | #JSON(JSON.t)],
  ~options: submitOptions<'state>=?,
  unit,
) => unit = "useSubmit"

// #endregion
