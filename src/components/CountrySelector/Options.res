open Belt

open ReactSelect
let getOptionsFromResponse = (countries: option<array<Country.t>>) =>
  countries
  ->Option.getWithDefault([])
  ->Array.map(item => {
    label: item.label,
    value: item.value,
  })
let use = () => {
  let (countries, _, _, _) = Hooks.useAsync(CountriesApi.fetch)
  getOptionsFromResponse(countries)
}
