type props<'state> = {
  children?: React.element,
  location?: StringOrLocation.t<'state>,
}

@module("react-router-dom")
external make: React.component<props<'state>> = "Routes"
