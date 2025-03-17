type props<'state> = {
  to: To.t,
  replace?: bool,
  state?: 'state,
  relative?: RelativeRoutingType.t,
}

@module("react-router-dom")
external make: React.component<props<'state>> = "Navigate"
