module Menu = {
  @react.component
  let make = (~children) => {
    <div
      style={ReactDOMStyle.make(
        ~backgroundColor="white",
        ~borderRadius="4px",
        ~marginTop="3px",
        ~position="absolute",
        ~zIndex="2",
        (),
      )}>
      children
    </div>
  }
}

module Blanket = {
  @react.component
  let make = (~onClick) =>
    <div
      style={ReactDOMStyle.make(
        ~bottom="0",
        ~left="0",
        ~top="0",
        ~right="0",
        ~position="fixed",
        ~zIndex="1",
        ~width="100%",
        (),
      )}
      onClick
    />
}

@react.component
let make = (~children, ~isOpen, ~target, ~onClose) => {
  <div style={ReactDOMStyle.make(~position="relative", ())}>
    {target}
    {isOpen ? <Menu> children </Menu> : React.null}
    {isOpen ? <Blanket onClick={onClose} /> : React.null}
  </div>
}
