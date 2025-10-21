type t<'state> = {
  ...ReactRouter__History.t<'state>,
  index: int,
}

type options<'state> = {
  initialEntries?: array<ReactRouter__StringOrLocation.t<'state>>,
  initialIndex?: int,
  v5Compat?: bool,
}

@module("react-router-dom")
external create: options<'state> => t<'state> = "createMemoryHistory"
