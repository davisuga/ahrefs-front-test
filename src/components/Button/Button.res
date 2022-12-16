%%raw(`import './Button.css'`)

@react.component
let make = (~children: React.element, ~onClick=?) => {
  <button ?onClick className="btn"> {children} </button>
}
