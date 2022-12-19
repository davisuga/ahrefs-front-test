type eventCode = [
  | #ArrowDown
  | #ArrowUp
  | #ArrowLeft
  | #ArrowRight
  | #Backspace
  | #Enter
  | #Escape
]
type event = {code: eventCode}

type eventType = [#keydown | #keyup | #keypress]

type eventListener

@scope("window") @val
external addEventListener: (eventType, event => unit) => eventListener = "addEventListener"

@scope("window") @val
external removeEventListener: (eventType, eventListener) => unit = "removeEventListener"
