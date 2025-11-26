/**
Layout component demonstrating:
- NavLink for navigation with active state styling
- Outlet for rendering child route content
*/
@react.component
let make = () => {
  <>
    <header>
      <nav>
        <ReactRouter.NavLink style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/"})}>
          {React.string("Dashboard")}
        </ReactRouter.NavLink>
        <ReactRouter.NavLink
          style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/settings"})}>
          {React.string("Settings")}
        </ReactRouter.NavLink>
        <ReactRouter.NavLink
          style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/users/123"})}>
          {React.string("User Profile")}
        </ReactRouter.NavLink>
        <ReactRouter.NavLink
          style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/newsletter"})}>
          {React.string("Newsletter")}
        </ReactRouter.NavLink>
        <ReactRouter.NavLink
          style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/protected"})}>
          {React.string("Protected")}
        </ReactRouter.NavLink>
        <ReactRouter.NavLink
          style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/error"})}>
          {React.string("Error")}
        </ReactRouter.NavLink>
      </nav>
    </header>
    <main>
      // Outlet renders the matched child route's element
      <ReactRouter.Outlet />
    </main>
  </>
}
