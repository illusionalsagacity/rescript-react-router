type listener<'state> = Update.t<'state> => unit

// internal?
// @module("react-router-dom")
// external createLocation: (StringOrLocation.t<'state>, To.t, ~state: 'state=?, ~key: string=?) => Location.t<'state> = "createLocation"

// #region Routers

// #region MemoryRouter
type memoryRouterOptions<'state> = {
  basename?: string,
  future?: FutureConfig.t,
  // hydrationData?: 'any,
  initialEntries?: array<StringOrLocation.t<'state>>,
  initialIndex?: int,
}

@module("react-router-dom")
external createMemoryRouter: (
  array<RouteObject.t<'data>>,
  ~options: memoryRouterOptions<'state>=?,
) => RemixRouter.t = "createMemoryRouter"

// #endregion

// #region BrowserRouter
type browserRouterOptions<'hydrationData> = {
  basename?: string,
  hydrationData?: 'hydrationData,
  dataStrategy?: DataStrategy.t,
  // patchRoutesOnHydration?: bool,
  window?: Dom.window,
}

@module("react-router-dom")
external createBrowserRouter: (
  array<RouteObject.t<'data>>,
  ~options: browserRouterOptions<'hydrationData>=?,
) => RemixRouter.t = "createBrowserRouter"
// #endregion

// #region HashRouter
type hashRouterOptions<'state> = {
  basename?: string,
  future?: FutureConfig.t,
  window?: Dom.window,
}

@module("react-router-dom")
external createHashRouter: (
  array<RouteObject.t<'data>>,
  ~options: hashRouterOptions<'state>=?,
) => RemixRouter.t = "createHashRouter"

// #endregion

// #region StaticRouter

type staticRouterOptions<'state> = {
  basename?: string,
  location: StringOrLocation.t<'state>,
  future?: FutureConfig.t,
  window?: Dom.window,
}

@module("react-router-dom")
external createStaticRouter: (
  array<RouteObject.t<'data>>,
  ~context: unknown,
  ~options: staticRouterOptions<'state>,
) => RemixRouter.t = "createStaticRouter"
// #endregion

// #endregion
// #region Utilities

@module("react-router-dom")
external createPath: PartialPath.t => string = "createPath"

@module("react-router-dom")
external parsePath: string => PartialPath.t = "parsePath"

@module("react-router-dom")
external matchRoutes: (
  array<RouteObject.t<'data>>,
  StringOrLocation.t<'state>,
  ~basename: string=?,
) => array<RouteMatch.t<'data>> = "matchRoutes"

@module("react-router-dom")
external matchPath: (PathPattern.t, string) => PathMatch.t = "matchPath"

@module("react-router-dom")
external resolvePath: (To.t, ~fromPathname: string=?) => Path.t = "resolvePath"

@module("react-router-dom")
external resolveTo: (To.t, array<string>, string) => Path.t = "resolveTo"

@module("react-router-dom")
external getToPathname: To.t => option<string> = "getToPathname"

@module("react-router-dom")
external stripBasename: (string, string) => string = "stripBasename"

// #region Fetch utilities

type response
// TODO: json

type responseInit = {status?: int, statusText?: string}
@module("react-router-dom")
external redirect: (string, ~options: responseInit=?) => response = "redirect"
@module("react-router-dom")
external redirectDocument: (string, ~options: responseInit=?) => response = "redirectDocument"
@module("react-router-dom")
external replace: (string, ~options: responseInit=?) => response = "replace"

// #endregion

// #endregion
// #region Hooks

@module("react-router-dom")
external useActionData: unit => option<'actionData> = "useActionData"

@module("react-router-dom")
external useAsyncError: unit => option<Error.t> = "useAsyncError"

@module("react-router-dom")
external useAsyncValue: unit => option<'asyncValue> = "useAsyncValue"

@module("react-router-dom") external useBeforeUnload: (unit => 'return) => unit = "useBeforeUnload"

type useHrefOptions = {relative?: RelativeRoutingType.t}

type blockerFunctionArgs<'oldState, 'newState> = {
  currentLocation: Location.t<'oldState>,
  nextLocation: Location.t<'newState>,
  action: Action.t,
}
type blockerFunction<'oldState, 'newState> = blockerFunctionArgs<'oldState, 'newState> => bool

@unboxed
type blockCondition<'oldState, 'newState> = Bool(bool) | Fn(blockerFunction<'oldState, 'newState>)

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

@module("react-router-dom")
external useBlocker: blockCondition<'oldState, 'newState> => blocker<'oldState, 'newState> =
  "useBlocker"

@module("react-router-dom")
external useHref: (To.t, ~options: useHrefOptions=?) => string = "useHref"

@module("react-router-dom")
external useInRouterContext: unit => bool = "useInRouterContext"

@module("react-router-dom")
external useLocation: unit => Location.t<'state> = "useLocation"

type linkClickHandlerOptionsOptions = {relative?: RelativeRoutingType.t}
type linkClickHandlerOptions<'state> = {
  target?: string,
  replace?: bool,
  state?: 'state,
  options?: linkClickHandlerOptionsOptions,
}

@module("react-router-dom")
external useLinkClickHandler: (
  To.t,
  ~options: linkClickHandlerOptions<'state>=?,
) => ReactEvent.Mouse.t => unit = "useLinkClickHandler"

@module("react-router-dom")
external useNavigation: unit => NavigationState.t<'locationState> = "useNavigation"

@module("react-router-dom")
external useNavigationType: unit => Action.t = "useNavigationType"

@module("react-router-dom")
external useMatch: @unwrap [#Path(Path.t) | #Pattern(PathPattern.t)] => PathMatch.t = "useMatch"

type match<'data, 'handle> = {
  id: string,
  pathname: string,
  data: 'data,
  params: Dict.t<string>,
  handle: 'handle,
}

@module("react-router-dom")
external useMatches: unit => array<match<'data, 'handle>> = "useMatches"

@module("react-router-dom")
external useNavigate: unit => (To.t, ~options: NavigateOptions.t<'state>=?) => unit = "useNavigate"

@module("react-router-dom") @return(nullable)
external useOutlet: unit => option<React.element> = "useOutlet"

@module("react-router-dom")
external useOutletContext: unit => 'context = "useOutletContext"

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

@module("react-router-dom")
external unstable_usePrompt: usePromptOptions<'oldState, 'newState> => unit = "unstable_usePrompt"

@module("react-router-dom")
external useResolvedPath: (To.t, ~options: useHrefOptions=?) => Path.t = "useResolvedPath"

type useViewTransitionStateOptions = {relative?: RelativeRoutingType.t}

@module("react-router-dom")
external useViewTransitionState: (To.t, ~options: useViewTransitionStateOptions=?) => bool =
  "useViewTransitionState"

@module("react-router-dom")
external useRoutes: (
  array<RouteObject.t<'data>>,
  ~location: StringOrLocation.t<'state>=?,
) => array<RouteMatch.t<'data>> = "useRoutes"

type revalidatorState = | @as("idle") Idle | @as("loading") Loading
type revalidator = {state: revalidatorState, revalidate: unit => unit}

@module("react-router-dom")
external useRevalidator: unit => revalidator = "useRevalidator"

@module("react-router-dom") external useLoaderData: unit => 'loaderData = "useLoaderData"

@module("react-router-dom") external useRouteError: unit => 'a = "useRouteError"

@module("react-router-dom")
external useRouteLoaderData: (
  @ignore RouteObject2.route<'loaderData, _, _>,
  string,
) => 'loaderData = "useRouteLoaderData"

let useRouteLoaderData = route => useRouteLoaderData(route, route.id)

@unboxed
type urlSearchParamsInit = String(string) | KeyValuePair((string, string)) | Dict(Dict.t<string>)

@module("react-router-dom")
external useSearchParams: (~init: urlSearchParamsInit) => 'a = "useSearchParams"

type useFormActionOptions = {relative?: RelativeRoutingType.t}

@module("react-router-dom")
external useFormAction: (~action: string=?, ~options: useFormActionOptions=?) => string =
  "useFormAction"

type fetcherOptions = {key?: string}

@module("react-router-dom")
external useFetcher: fetcherOptions => Fetcher.t = "useFetcher"

@module("react-router-dom")
external useFetchers: unit => array<PublicFetcher.t> = "useFetchers"

type submittable = Element(Dom.element)

type formData
type urlSearchParams

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

@module("react-router-dom")
external useSubmit: @unwrap
(
  [#Element(Dom.element) | #FormData(formData) | #URLSearchParams(urlSearchParams) | #JSON(JSON.t)],
  ~options: submitOptions<'state>=?,
) => unit => unit = "useSubmit"

// #endregion
