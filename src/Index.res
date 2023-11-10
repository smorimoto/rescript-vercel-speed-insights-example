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
  | None => ()
  }
}

SpeedInsights.webVitals()
