type props<'state> = {
  basename?: string,
  children?: React.element,
  location?: ReactRouter__StringOrLocation.t<'state>,
  future?: ReactRouter__FutureConfig.t,
}

@module("react-router-dom/server")
external make: React.component<props<'state>> = "StaticRouter"
