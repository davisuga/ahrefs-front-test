open React
open Belt
%%raw(`import "/node_modules/flag-icons/css/flag-icons.min.css"`)
%%raw(`import './CountrySelect.css'`)

@react.component
let make = (~className="", ~country: option<string>, ~onChange: string => unit) => {
  let options = Options.use()
  let countryLabel = country->Option.getWithDefault("")
  let (isOpen, setIsOpen) = useState(_ => false)

  let name =
    options
    ->Array.getBy(option => option.value == countryLabel)
    ->Option.map(option => option.label)
    ->Option.getWithDefault("Select a country")

  <div className={"country-select-container " ++ className}>
    <Dropdown
      isOpen
      onClose={_ => setIsOpen(_ => false)}
      target={<Button onClick={_ => setIsOpen(prev => !prev)}>
        <Text> {name} </Text>
        <ArrowDown />
      </Button>}>
      <div className="internal-select-container">
        <ReactSelect
          options
          value=country
          isSearchable={true}
          menuIsOpen=true
          autoFocus=true
          onChange={country => {
            onChange(country.value)
            setIsOpen(_ => false)
          }}
          className={"popup"}
          classNamePrefix="react-select"
          components={{
            \"IndicatorSeparator": () => React.null,
            \"DropdownIndicator": () => React.null,
            \"Option": props => {
              <div
                className={"country-option " ++ (props.isFocused ? "country-option-selected" : "")}
                onClick={props.innerProps.onClick}>
                <span className={`fi fi-${props.data.value}`} />
                <Text> props.data.label </Text>
              </div>
            },
          }}
          styles={{
            menu: _ => ReactDOMStyle.make(),
            menuList: base => base->ReactDOMStyle.combine(ReactDOMStyle.make(~padding="0", ())),
            control: _ =>
              ReactDOMStyle.make(~border="0px solid #EBEBEB ", ~borderBottomWidth="1px", ()),
            option: base => base->ReactDOMStyle.combine(ReactDOMStyle.make(~background="#fff", ())),
          }}
        />
      </div>
    </Dropdown>
  </div>
}
