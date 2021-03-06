defmodule Surface.Components.Form.TextInputTest do
  use ExUnit.Case, async: true

  import ComponentTestHelper
  alias Surface.Components.Form.TextInput, warn: false

  test "empty input" do
    code = """
    <TextInput form="user" field="name" />
    """

    assert render_live(code) =~ """
           <input id="user_name" name="user[name]" type="text"/>
           """
  end

  test "setting the value" do
    code = """
    <TextInput form="user" field="name" value="Max" />
    """

    assert render_live(code) =~ """
           <input id="user_name" name="user[name]" type="text" value="Max"/>
           """
  end

  test "setting the class" do
    code = """
    <TextInput form="user" field="name" class="input" />
    """

    assert render_live(code) =~ ~r/class="input"/
  end

  test "setting multiple classes" do
    code = """
    <TextInput form="user" field="name" class="input primary" />
    """

    assert render_live(code) =~ ~r/class="input primary"/
  end

  test "passing other options" do
    code = """
    <TextInput form="user" field="name" opts={{ id: "myid", autofocus: "autofocus" }} />
    """

    assert render_live(code) =~ """
           <input autofocus="autofocus" id="myid" name="user[name]" type="text"/>
           """
  end

  test "blur event with parent live view as target" do
    code = """
    <TextInput form="user" field="color" value="Max" blur="my_blur" />
    """

    assert render_live(code) =~ """
           <input id="user_color" name="user[color]" phx-blur="my_blur" type="text" value="Max"/>
           """
  end

  test "focus event with parent live view as target" do
    code = """
    <TextInput form="user" field="color" value="Max" focus="my_focus" />
    """

    assert render_live(code) =~ """
           <input id="user_color" name="user[color]" phx-focus="my_focus" type="text" value="Max"/>
           """
  end

  test "capture click event with parent live view as target" do
    code = """
    <TextInput form="user" field="color" value="Max" capture_click="my_click" />
    """

    assert render_live(code) =~ """
           <input id="user_color" name="user[color]" phx-capture-click="my_click" type="text" value="Max"/>
           """
  end

  test "keydown event with parent live view as target" do
    code = """
    <TextInput form="user" field="color" value="Max" keydown="my_keydown" />
    """

    assert render_live(code) =~ """
           <input id="user_color" name="user[color]" phx-keydown="my_keydown" type="text" value="Max"/>
           """
  end

  test "keyup event with parent live view as target" do
    code = """
    <TextInput form="user" field="color" value="Max" keyup="my_keyup" />
    """

    assert render_live(code) =~ """
           <input id="user_color" name="user[color]" phx-keyup="my_keyup" type="text" value="Max"/>
           """
  end
end

defmodule Surface.Components.Form.TextInputConfigTest do
  use ExUnit.Case

  import ComponentTestHelper
  alias Surface.Components.Form.TextInput, warn: false

  test ":default_class config" do
    using_config TextInput, default_class: "default_class" do
      code = """
      <TextInput/>
      """

      assert render_live(code) =~ ~r/class="default_class"/
    end
  end
end
