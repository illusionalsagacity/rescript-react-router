type t<'state> = {
  action: Action.t,
  location: Location.t<'state>,
  delta: Null.t<int>,
}
