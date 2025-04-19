let () = {
  switch ReactDOM.querySelector("#root") {
  | Some(root) =>
    root
    ->ReactDOM.Client.createRoot
    ->ReactDOM.Client.Root.render(
      <React.StrictMode>
        <App />
      </React.StrictMode>,
    )
  | None => "Root element not found - unable to initialise the application"->Js.Console.error
  }
}

SpeedInsights.webVitals()
