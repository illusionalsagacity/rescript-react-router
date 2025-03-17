type props<'state> = {
  basename?: string,
  children?: React.element,
  initialEntries?: array<StringOrLocation.t<'state>>,
  initialIndex?: int,
}
