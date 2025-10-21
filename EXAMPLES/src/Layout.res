@react.component
let make = () => {
  <>
    <header>
      <nav>
        <ReactRouter.NavLink style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/"})}>
          {React.string("Home")}
        </ReactRouter.NavLink>
        <ReactRouter.NavLink
          style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/dashboard"})}>
          {React.string("Dashboard")}
        </ReactRouter.NavLink>
        <ReactRouter.NavLink
          style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/settings"})}>
          {React.string("Settings")}
        </ReactRouter.NavLink>
        <ReactRouter.NavLink
          style={StyleObj({padding: "8px 16px"})} to={Path({pathname: "/error"})}>
          {React.string("Error")}
        </ReactRouter.NavLink>
      </nav>
    </header>
    <main>
      <ReactRouter.Outlet />
    </main>
  </>
}
