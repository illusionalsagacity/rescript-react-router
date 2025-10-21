type t<'state> = {
  action: ReactRouter__Action.t,
  location: ReactRouter__Location.t<'state>,
}

@send external createHref: (t<'state>, ReactRouter__To.t) => string = "createHref"
// FIXME: incompatible with rescript-msw
// @send external createURL: (t<'state>, To.t) => ReactRouter__Url.t = "createURL"
@send
external encodeLocation: (t<'state>, ReactRouter__To.t) => ReactRouter__Path.t = "encodeLocation"
@send external push: (t<'state>, ReactRouter__To.t, ~state: 'newState=?) => unit = "push"
@send external replace: (t<'state>, ReactRouter__To.t, ~state: 'newState=?) => unit = "replace"
@send external go: (t<'state>, int) => unit = "go"
@send external listen: (t<'state>, ReactRouter__Update.t<'state> => unit, unit) => unit = "listen"
