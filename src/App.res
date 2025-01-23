@react.component
let make = () => {
  <div className="p-2">
    <h1 className="font-bold text-2xl">
      {"ReScript Vercel Speed Insights Example"->React.string}
    </h1>
    <p className="text-base">
      <span className="font-semibold"> {"IMPORTANT"->React.string} </span>
      {": Open the console!"->React.string}
    </p>
  </div>
}
