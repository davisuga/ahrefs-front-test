%%raw(`import './styles.css'`)

@react.component
let make = (~children: React.element) => {
  <button className="btn"> {children} </button>
}
