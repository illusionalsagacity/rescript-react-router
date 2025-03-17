type t<'state> = {
  action: Action.t,
  location: Location.t<'state>,
}

@send external createHref: (t<'state>, To.t) => string = "createHref"
@send external createURL: (t<'state>, To.t) => Url.t = "createURL"
@send external encodeLocation: (t<'state>, To.t) => Path.t = "encodeLocation"
@send external push: (t<'state>, To.t, ~state: 'newState=?) => unit = "push"
@send external replace: (t<'state>, To.t, ~state: 'newState=?) => unit = "replace"
@send external go: (t<'state>, int) => unit = "go"
@send external listen: (t<'state>, Update.t<'state> => unit) => unit => unit = "listen"
