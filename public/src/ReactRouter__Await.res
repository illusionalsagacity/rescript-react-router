type props<'resolved> = {
  resolve: Promise.t<'resolved>,
  children: 'resolved => React.element, // could also be a React.element
  errorElement?: React.element,
}

@module("react-router-dom")
external make: React.component<props<'resolved>> = "Await"
