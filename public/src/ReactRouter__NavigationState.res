type formEncType =
  | @as("application/x-www-form-urlencoded") UrlEncoded
  | @as("multipart/form-data") FormData
  | @as("text/plain") TextPlain

type state = | @as("idle") Idle | @as("loading") Loading | @as("submitting") Submitting

type t<'locationState> = {
  state: state,
  location: ReactRouter__Location.t<'locationState>,
  formData: Null.t<unknown>, // TODO
  json: Null.t<JSON.t>,
  text: Null.t<string>,
  formAction: option<string>,
  formMethod: option<string>,
  formEncType: formEncType,
}
