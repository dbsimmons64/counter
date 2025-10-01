import gleam/int
import lustre
import lustre/attribute.{attribute}
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

type Model =
  Int

// Subject-Verb-Object
type Msg {
  UserClickedIncrement
  UserClickedDecrement
}

fn init(_args) -> Model {
  0
}

fn update(model: Model, msg: Msg) -> Model {
  case msg {
    UserClickedIncrement -> model + 1
    UserClickedDecrement -> model - 1
  }
}

fn view(model: Model) -> Element(Msg) {
  let count = int.to_string(model)

  html.div(
    [
      attribute.class(
        "flex flex-col items-center justify-center text-[300%] absolute w-full h-full -top-[15%]",
      ),
    ],
    [
      html.text("Counter App"),
      html.div(
        [
          attribute.class("text-[120%] relative top-[10vh]"),
        ],
        [html.text(count)],
      ),
      html.div([attribute.class("buttons")], [
        button("Increment", "bg-green-500", UserClickedIncrement),
        button("Decrement", "bg-red-500", UserClickedDecrement),
      ]),
    ],
  )
}

fn button(title: String, background_color: String, action: Msg) -> Element(Msg) {
  html.button(
    [
      attribute.class(
        "text-[60%] relative top-[20vh] mr-[5px] px-3 border-2 broder-solid border-black rounded-[8%] text-white "
        <> background_color,
      ),
      event.on_click(action),
    ],
    [html.text(title)],
  )
}

pub fn main() -> Nil {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}
