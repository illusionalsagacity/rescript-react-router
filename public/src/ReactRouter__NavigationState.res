/**
Form encoding type for submission state.
*/
type formEncType =
  | @as("application/x-www-form-urlencoded") UrlEncoded
  | @as("multipart/form-data") FormData
  | @as("text/plain") TextPlain

/**
Navigation state indicating current navigation activity.
- `Idle`: No navigation in progress
- `Loading`: Navigation in progress, waiting for loaders
- `Submitting`: Form submission in progress
*/
type state = | @as("idle") Idle | @as("loading") Loading | @as("submitting") Submitting

/**
Current navigation state returned by useNavigation.
Use to build loading indicators and optimistic UI.
- `state`: Current navigation activity (idle, loading, submitting)
- `location`: The location being navigated to
- `formData`: Form data being submitted (null if not submitting)
- `json`: JSON data being submitted
- `text`: Text data being submitted
- `formAction`: URL the form is submitting to
- `formMethod`: HTTP method being used
- `formEncType`: Encoding type of the form submission
*/
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
