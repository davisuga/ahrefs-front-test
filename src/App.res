@module("./logo.svg") external logo: string = "default"
%%raw(`import './App.css'`)

@react.component
let make = () => {
  let (country, setCountry) = React.useState(_ => None)
  <div className="App">
    <CountrySelect
      className="custom-class" country onChange={country => setCountry(_ => Some(country))}
    />
  </div>
}
