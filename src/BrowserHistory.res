type t<'state> = History.t<'state>

type options = {
  window?: Dom.window,
  v5Compat?: bool,
}

@module("react-router-dom")
external create: options => t<'state> = "createBrowserHistory"
