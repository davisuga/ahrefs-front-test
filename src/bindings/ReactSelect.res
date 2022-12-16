type styles = {
  clearIndicator?: ReactDOM.style => ReactDOM.style,
  container?: ReactDOM.style => ReactDOM.style,
  control?: ReactDOM.style => ReactDOM.style,
  dropdownIndicator?: ReactDOM.style => ReactDOM.style,
  group?: ReactDOM.style => ReactDOM.style,
  groupHeading?: ReactDOM.style => ReactDOM.style,
  indicatorsContainer?: ReactDOM.style => ReactDOM.style,
  indicatorSeparator?: ReactDOM.style => ReactDOM.style,
  input?: ReactDOM.style => ReactDOM.style,
  loadingIndicator?: ReactDOM.style => ReactDOM.style,
  loadingMessage?: ReactDOM.style => ReactDOM.style,
  menu?: ReactDOM.style => ReactDOM.style,
  menuList?: ReactDOM.style => ReactDOM.style,
  menuPortal?: ReactDOM.style => ReactDOM.style,
  multiValue?: ReactDOM.style => ReactDOM.style,
  multiValueLabel?: ReactDOM.style => ReactDOM.style,
  multiValueRemove?: ReactDOM.style => ReactDOM.style,
  noOptionsMessage?: ReactDOM.style => ReactDOM.style,
  option?: ReactDOM.style => ReactDOM.style,
  placeholder?: ReactDOM.style => ReactDOM.style,
  singleValue?: ReactDOM.style => ReactDOM.style,
  valueContainer?: ReactDOM.style => ReactDOM.style,
}

type optionComponentPropsData = {
  value: string,
  label: string,
}
type optionInnerProps = {onClick: ReactEvent.Mouse.t => unit, id: string}
type optionComponentProps = {
  data: optionComponentPropsData,
  innerProps: optionInnerProps,
  isFocused: bool,
  isSelected: bool,
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
  \"Option"?: optionComponentProps => React.element,
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
  ~controlShouldRenderValue: bool=?,
  ~hideSelectedOptions: bool=?,
  ~isClearable: bool=?,
  ~options: array<opt>,
  ~onChange: opt => unit,
  ~placeholder: string=?,
  ~className: string=?,
  ~value: option<string>,
  ~isSearchable: bool=?,
  ~components: components=?,
  ~classNamePrefix: string=?,
  ~tabSelectsValue: bool=?,
  ~autoFocus: bool=?,
) => React.element = "default"

module Components = {
  module Option = {
    @react.component @module("react-select") @scope("components")
    external make: (
      ~children: React.element=?,
      ~isSelected: bool=?,
      ~isFocused: bool=?,
      ~onClick: ReactEvent.Mouse.t => unit=?,
      ~className: string=?,
    ) => React.element = "Option"
  }
  let x = <Option />
}
