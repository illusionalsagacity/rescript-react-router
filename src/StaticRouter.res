type props<'state> = {
  basename?: string,
  children?: React.element,
  location?: StringOrLocation.t<'state>,
  future?: FutureConfig.t,
}

@module("react-router-dom/server")
external make: React.component<props<'state>> = "StaticRouter"
