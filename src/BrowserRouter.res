type props = {
  basename?: string,
  children?: React.element,
  future?: FutureConfig.t,
  window?: Dom.window,
}

@module("react-router-dom")
external make: React.component<props> => React.element = "BrowserRouter"
