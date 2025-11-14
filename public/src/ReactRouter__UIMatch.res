/**
`data` and `handle` are omitted in the record type to allow the type to be monomorphic, so that [useMatches](./ReactRouter.res) can return an array of matches with multiple types of data
 */
type t = {
  id: string,
  pathname: string,
  params: Dict.t<string>,
}

@get external unsafe_data: t => 'data = "data"
@get external unsafe_handle: t => 'handle = "handle"
