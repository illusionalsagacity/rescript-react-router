type props<'state> = {
  to: ReactRouter__To.t,
  replace?: bool,
  state?: 'state,
  relative?: ReactRouter__RelativeRoutingType.t,
}

@module("react-router-dom")
external make: React.component<props<'state>> = "Navigate"
