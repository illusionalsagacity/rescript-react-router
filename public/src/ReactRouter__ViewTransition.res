/**
 * Bindings for the ViewTransition interface in the Document API.
 * This is part of the View Transitions API.
 */
type t = {
  finished: Js.Promise.t<unit>,
  ready: Js.Promise.t<unit>,
  updateCallbackDone: Js.Promise.t<unit>,
  @send
  skipTransition: unit => unit,
}

/**
 * Extend the Document interface to include startViewTransition
 */
module Document = {
  type callback = unit => Js.Promise.t<unit>

  @val @scope("document")
  external startViewTransition: callback => t = "startViewTransition"
}

/**
 * Provide a global access to startViewTransition for convenience
 */
@val
@scope("document")
external startViewTransition: (unit => Js.Promise.t<unit>) => t = "startViewTransition"
