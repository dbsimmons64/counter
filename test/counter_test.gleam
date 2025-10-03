import birdie
import counter
import gleeunit
import gleeunit/should
import lustre/element

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn init_sets_count_to_zero_test() {
  counter.init(Nil)
  |> should.equal(0)
}

pub fn update_with_user_clicked_increment_test() {
  let model = 3
  counter.view(model)
  |> element.to_readable_string()
  |> birdie.snap(title: "Set counter to 3")
  //  io.print(element.to_readable_string(foo))

  //   counter.update(model, counter.UserClickedIncrement)
  //   |> should.equal(4)
}
