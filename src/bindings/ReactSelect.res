type styles = {
  clearIndicator?: ReactDOM.style,
  container?: ReactDOM.style,
  control?: ReactDOM.style,
  dropdownIndicator?: ReactDOM.style,
  group?: ReactDOM.style,
  groupHeading?: ReactDOM.style,
  indicatorsContainer?: ReactDOM.style,
  indicatorSeparator?: ReactDOM.style,
  input?: ReactDOM.style,
  loadingIndicator?: ReactDOM.style,
  loadingMessage?: ReactDOM.style,
  menu?: ReactDOM.style,
  menuList?: ReactDOM.style,
  menuPortal?: ReactDOM.style,
  multiValue?: ReactDOM.style,
  multiValueLabel?: ReactDOM.style,
  multiValueRemove?: ReactDOM.style,
  noOptionsMessage?: ReactDOM.style,
  option?: ReactDOM.style,
  placeholder?: ReactDOM.style,
  singleValue?: ReactDOM.style,
  valueContainer?: ReactDOM.style,
}
type components = {
  \"ClearIndicator"?: unit => React.element,
  \"Container"?: unit => React.element,
  \"Control"?: unit => React.element,
  \"DropdownIndicator"?: unit => React.element,
  \"Group"?: unit => React.element,
  \"GroupHeading"?: unit => React.element,
  \"IndicatorsContainer"?: unit => React.element,
  \"IndicatorSeparator"?: unit => React.element,
  \"Input"?: unit => React.element,
  \"LoadingIndicator"?: unit => React.element,
  \"LoadingMessage"?: unit => React.element,
  \"Menu"?: unit => React.element,
  \"MenuList"?: unit => React.element,
  \"MenuPortal"?: unit => React.element,
  \"MultiValue"?: unit => React.element,
  \"MultiValueLabel"?: unit => React.element,
  \"MultiValueRemove"?: unit => React.element,
  \"NoOptionsMessage"?: unit => React.element,
  \"Option"?: unit => React.element,
  \"Placeholder"?: unit => React.element,
  \"SingleValue"?: unit => React.element,
  \"ValueContainer"?: unit => React.element,
}
type opt = {
  value: string,
  label: string,
}

@react.component @module("react-select")
external make: (
  ~styles: styles=?,
  ~menuIsOpen: bool=?,
  ~options: array<opt>,
  ~onChange: string => unit,
  ~placeholder: string=?,
  ~value: option<string>,
  ~components: components=?,
) => React.element = "default"