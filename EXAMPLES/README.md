# Examples

Working examples demonstrating the `@illusionalsagacity/rescript-react-router` bindings.

## Running

```bash
yarn install
yarn run res:build
yarn run dev
```

Open http://localhost:5173

## Files

| File                 | Demonstrates                                              |
| -------------------- | --------------------------------------------------------- |
| `Routes.res`         | `RouteObject.Route`, loaders, actions, nested routes      |
| `Layout.res`         | `NavLink` with `StyleObj`, `Outlet`                       |
| `Dashboard.res`      | `Link` with `To.String`                                   |
| `Settings.res`       | `useLoaderData`, `useNavigation`, `useActionData`, `Form` |
| `UserProfile.res`    | `useParams`, `useLocation`, `useNavigate`                 |
| `NewsletterForm.res` | `useFetcher`, fetcher form component                      |
| `ProtectedRoute.res` | Loader-based auth, `redirect` utility                     |
| `ErrorRoute.res`     | `useRouteError`                                           |

## Mock API

Uses [MSW](https://mswjs.io/) to mock `/api/settings`. See `SetupMSW.res`.
