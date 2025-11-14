type loaderArgs = {
  params: Dict.t<string>,
  request: Fetch.Request.t,
}

type actionArgs = {
  params: Dict.t<string>,
  request: Fetch.Request.t,
}

@unboxed
type rec t =
  | Route({
      id: string,
      caseSensitive?: bool,
      children?: array<t>,
      element?: React.element,
      index?: bool,
      path?: string,
      loader?: loaderArgs => promise<'loaderResponse>,
      action?: actionArgs => promise<'actionResponse>,
      errorElement?: React.element,
      hydrateFallbackElement?: React.element,
      handle?: 'handle,
      shouldRevalidate?: bool,
      @as("lazy") lazy_?: unit => promise<unknown>,
    }): t
