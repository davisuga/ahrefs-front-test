open React
open Belt
open Utils

%%raw(`import "/node_modules/flag-icons/css/flag-icons.min.css"`)
%%raw(`import './CountrySelect.css'`)

module Styles = {
  open ReactDOMStyle
  let menu = make()
  let menuList = make(~padding="0", ())
  let control = make(
    ~border="0px solid #EBEBEB ",
    ~borderBottomWidth="1px",
    ~display="flex",
    ~flexDirection="row-reverse",
    ~height="35px",
    ~paddingLeft="10px",
    ~columnGap="6px",
    (),
  )
  let option = make(~background="#fff", ())
  let valueContainer = make(~padding="0px", ())
}

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

  let onChangeSelect = (country: ReactSelect.opt) => {
    onChange(country.value)
    setIsOpen(_ => false)
  }

  React.useEffect0(() => {
    let listener = Window.addEventListener(#keydown, event => {
      switch event.code {
      | #Escape => setIsOpen(_ => false)
      | #Enter => setIsOpen(_ => true)
      | #Backspace => onChange("")
      | _ => ()
      }
    })

    Some(() => Window.removeEventListener(#keydown, listener))
  })

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
          onChange=onChangeSelect
          placeholder="Search"
          className={"popup"}
          classNamePrefix="react-select"
          components={{
            \"IndicatorSeparator": () => React.null,
            \"DropdownIndicator": () => <Magnify />,
            \"Option": props => {
              <CountryItem
                isFocused=props.isFocused
                onClick=props.innerProps.onClick
                label=props.data.label
                value=props.data.value
              />
            },
          }}
          styles={{
            menu: _ => Styles.menu,
            menuList: combineStyle(Styles.menuList),
            control: _ => Styles.control,
            option: combineStyle(Styles.option),
            valueContainer: combineStyle(Styles.valueContainer),
          }}
        />
      </div>
    </Dropdown>
  </div>
}
