@react.component
let make = (~children: string, ~className=?) => <div ?className> {children->React.string} </div>
