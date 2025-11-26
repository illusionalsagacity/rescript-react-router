# rescript-react-router

ReScript bindings for [react-router-dom v6](https://reactrouter.com/).

> [!WARNING]
> The bindings for data routers are incomplete and won't allow for type-safe loader or action response types in `useLoaderData` / `useActionData`

## Installation

```bash
npm install @illusionalsagacity/rescript-react-router react-router-dom
```

Add to your `rescript.json`:

```json
{
  "dependencies": ["@illusionalsagacity/rescript-react-router"]
}
```

## Module Organization

All bindings are accessible through the `ReactRouter` module:

| Module                        | Description                                                                       |
| ----------------------------- | --------------------------------------------------------------------------------- |
| `ReactRouter`                 | Main entry point with hooks, router creation functions, and component re-exports  |
| `ReactRouter.To`              | Unboxed variant: `String(string)` or `Path({pathname, search, hash})`             |
| `ReactRouter.RouteObject`     | GADT variant for route definitions with `Route`                                   |
| `ReactRouter.Form`            | Form component with `method` type (`Get`, `Post`, `Put`, `Patch`, `Delete`)       |
| `ReactRouter.NavLink`         | NavLink with `stylePropType` and `stringOrRenderPropsFn` for active state styling |
| `ReactRouter.NavigationState` | Tagged variant: `Idle`, `Loading`, `Submitting`                                   |
| `ReactRouter.PublicFetcher`   | Fetcher state: `Idle`, `Loading`, `Submitting`                                    |
| `ReactRouter.Location`        | Location record with `pathname`, `search`, `hash`, `state`, `key`                 |

## Binding Patterns

### To Type (Unboxed Variant)

The `to` prop on `Link`, `NavLink`, `Navigate`, and `useNavigate` accepts an unboxed variant:

```rescript
// String path
<ReactRouter.Link to={String("/dashboard")} />

// Path object
<ReactRouter.Link to={Path({pathname: "/search", search: "?q=test"})} />
```

### NavLink Props

`NavLink` uses unboxed variants for `className` and `style` props to support both static values and render functions:

```rescript
// Static className
<ReactRouter.NavLink to={String("/")} className={ClassName("nav-link")} />

// Render function for active state
<ReactRouter.NavLink
  to={String("/")}
  className={ClassNameFn(({isActive}) => isActive ? "active" : "")}
  style={StyleFn(({isPending}) => isPending ? {opacity: "0.5"} : {})}
/>
```

### Form Method

Form method uses a tagged variant that maps to HTTP verbs:

```rescript
<ReactRouter.Form method=Post action="/api/submit">
  // ...
</ReactRouter.Form>
```

### Hooks

Hooks are bound directly on the `ReactRouter` module:

```rescript
let params = ReactRouter.useParams()           // Dict.t<string>
let location = ReactRouter.useLocation()       // Location.t
let navigate = ReactRouter.useNavigate()       // (To.t, ~options=?) => unit
let navigation = ReactRouter.useNavigation()   // NavigationState.navigation
let loaderData = ReactRouter.useLoaderData()   // JSON.t
let actionData = ReactRouter.useActionData()   // Nullable.t<JSON.t>
let fetcher = ReactRouter.useFetcher({})       // PublicFetcher.t
let matches = ReactRouter.useMatches()         // array<match>
let error = ReactRouter.useRouteError()        // unknown
let blocker = ReactRouter.useBlocker(shouldBlock)
```

### Router Creation

Data router creation functions:

```rescript
let router = ReactRouter.createBrowserRouter(routes)
let router = ReactRouter.createHashRouter(routes)
let router = ReactRouter.createMemoryRouter(routes, ~options?)
let router = ReactRouter.createStaticRouter(routes, context)
```

### RouteObject

Routes are defined using a GADT variant:

```rescript
let route = ReactRouter.RouteObject.Route({
  id: "settings",
  path: "settings",
  element: <Settings />,
  loader: async args => { /* ... */ },
  action: async args => { /* ... */ },
  errorElement: <ErrorBoundary />,
  children: [...],
})
```

### Fetcher Form

The fetcher's `form` property is a React component. Use `React.createElement` to render:

```rescript
let fetcher = ReactRouter.useFetcher({})

React.createElement(
  fetcher.form,
  {method: ReactRouter.Form.Post, action: "/api/endpoint", children: /* ... */}
)
```

## Examples

See `EXAMPLES/` for working examples. Run with:

```bash
cd EXAMPLES
yarn install
yarn run res:build
yarn run dev
```

## License

MIT
