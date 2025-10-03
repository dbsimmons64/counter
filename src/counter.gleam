import gleam/int
import lustre
import lustre/attribute
import lustre/element.{type Element}
import lustre/element/html
import lustre/event

pub type Model =
  Int

// Subject-Verb-Object
pub type Msg {
  UserClickedIncrement
  UserClickedDecrement
}

pub fn init(_args) -> Model {
  0
}

pub fn update(model: Model, msg: Msg) -> Model {
  case msg {
    UserClickedIncrement -> model + 1
    UserClickedDecrement -> model - 1
  }
}

pub fn view(model: Model) -> Element(Msg) {
  let count = int.to_string(model)

  html.div(
    [
      attribute.class(
        "min-h-screen flex items-center justify-center bg-gray-100",
      ),
    ],
    [
      html.div(
        [
          attribute.class(
            "bg-white shadow-lg rounded-xl p-8 flex flex-col items-center",
          ),
        ],
        [
          html.h2([attribute.class("text-2xl font-medium-bold mb-4")], [
            html.text("Counter App"),
          ]),
          html.h1([attribute.class("text-5xl font-semibold mb-6")], [
            html.text(count),
          ]),

          html.div([attribute.class("flex gap-4")], [
            button("Increment", UserClickedIncrement),
            button("Decrement", UserClickedDecrement),
          ]),
        ],
      ),
    ],
  )
}

pub fn button(title: String, action: Msg) -> Element(Msg) {
  html.button(
    [
      attribute.class(
        "px-5 py-2 bg-orange-500 hover:bg-orange-600 text-white rounded-lg transition",
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
