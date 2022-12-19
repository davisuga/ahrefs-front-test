let flip = (f, a, b) => f(b, a)

let combineStyle = flip(ReactDOMStyle.combine)
