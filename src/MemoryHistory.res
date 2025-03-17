type t<'state> = {
  ...History.t<'state>,
  index: int,
}

type options<'state> = {
  initialEntries?: array<StringOrLocation.t<'state>>,
  initialIndex?: int,
  v5Compat?: bool,
}

@module("react-router-dom")
external create: options<'state> => t<'state> = "createMemoryHistory"
