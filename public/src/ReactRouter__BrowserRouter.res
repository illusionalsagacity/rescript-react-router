type props = {
  basename?: string,
  children?: React.element,
  future?: ReactRouter__FutureConfig.t,
  window?: Dom.window,
}

@module("react-router-dom")
external make: React.component<props> = "BrowserRouter"
