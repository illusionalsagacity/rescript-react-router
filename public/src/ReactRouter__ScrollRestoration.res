type props<'state> = {
  getKey?: ReactRouter__Location.t<'state> => Null.t<string>,
  storageKey?: string,
}

@module("react-router-dom")
external make: React.component<props<'state>> = "ScrollRestoration"
