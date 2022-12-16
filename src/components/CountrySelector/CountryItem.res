@react.component
let make = (~isFocused, ~onClick, ~value, ~label) => {
  <div
    className={"country-option " ++ (isFocused ? "country-option-selected" : "")} onClick={onClick}>
    <span className={`fi fi-${value}`} />
    <Text> label </Text>
  </div>
}
