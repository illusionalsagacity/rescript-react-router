type props<'state> = {
  basename?: string,
  children?: React.element,
  // future?: ReactRouter.futureConfig,
  // history: History.t<'state>,
}

@module("react-router-dom")
external make: React.component<props<'state>> => React.element = "unstable_HistoryRouter"
