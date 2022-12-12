open React

type status<'a> = Error(exn) | Success('a) | Idle | Pending
let useAsync = (~immediate=true, asyncFunction) => {
  let (status, setStatus) = useState(_ => Idle)
  let (value, setValue) = useState(_ => None)
  let (error, setError) = useState(_ => None)

  let execute = useCallback1(() => {
    setStatus(_ => Pending)
    setValue(_ => None)
    setError(_ => None)
    asyncFunction()
    ->Promise.then(response => {
      setValue(_ => Some(response))
      setStatus(_ => Success(response))
      Js.Promise.resolve()
    })
    ->Promise.catch(error => {
      setError(_ => Some(error))
      setStatus(_ => Error(error))
      Promise.resolve()
    })
  }, [asyncFunction])

  useEffect2(() => {
    let _ = immediate ? execute() : Js.Promise.resolve()
    None
  }, (execute, immediate))

  (value, execute, status, error)
}
