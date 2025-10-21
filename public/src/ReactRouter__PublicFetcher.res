type state = | @as("idle") Idle | @as("submitting") Submitting | @as("loading") Loading

type t = {
  state: state,
  formAction: string,
  formMethod: string,
  // these are only available when submitting
  formData: Js.Dict.t<string>, // FIXME: formData type
  json: option<JSON.t>,
  text: option<string>,
}

// typed as a separate function so that arrays can have different data types
@get external data: t => 'loaderData = "data"
