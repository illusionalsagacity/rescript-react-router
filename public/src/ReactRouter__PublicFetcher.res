/**
Fetcher state indicating the current operation.
- `Idle`: Not fetching
- `Submitting`: Form submission in progress
- `Loading`: Loading data
*/
type state = | @as("idle") Idle | @as("submitting") Submitting | @as("loading") Loading

/**
Public fetcher information returned by useFetchers.
- `state`: Current fetcher state (idle, submitting, loading)
- `formAction`: URL the form is submitting to
- `formMethod`: HTTP method being used
- `formData`: Form data being submitted
- `json`: JSON data if submitting JSON
- `text`: Text data if submitting text
*/
type t = {
  state: state,
  formAction: string,
  formMethod: string,
  // these are only available when submitting
  formData: Js.Dict.t<string>, // FIXME: formData type
  json: option<JSON.t>,
  text: option<string>,
}

/**
Access the data returned by the fetcher's loader.
Note: Return type is not type-safe - cast to your expected type.
*/
@get
external data: t => 'loaderData = "data"
