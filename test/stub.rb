assert("stub") do
  class Test
    def test(arg)
      "test with #{arg}"
    end
  end

  t = Test.new
  t.stub(:test, "test stub") do
    assert_equal("test stub", t.test("stub"))
  end

  stub_block = Proc.new do |arg|
    assert_equal("stub", arg)
    "test stub"
  end
  t.stub(:test, stub_block) do
    assert_equal("test stub", t.test("stub"))
  end
end
