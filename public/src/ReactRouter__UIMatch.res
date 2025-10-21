type t<'data, 'handle> = {
  id: string,
  pathname: string,
  params: Dict.t<string>,
  data: 'data,
  handle: 'handle,
}
