require_relative 'test_helper'

class JassVueSFCTest < Minitest::Test
  
  def setup
    Nodo.logger.clear!
  end

  def test_compile_component
    result = compile_component('HelloWorld.vue')
    assert_match /export default __sfc__/, result
  end
  
  def test_compilation_error
    assert_raises Nodo::JavaScriptError do
      compile_component('Broken.vue')
    end
    assert_equal 1, Nodo.logger.errors.size
    assert_match /Nodo::JavaScriptError/, Nodo.logger.errors.first
  end
  
  private
  
  def compile_component(name)
    Jass::Vue::SFC::Compiler.compile(load_component(name), name)
  end
  
  def load_component(name)
    Pathname.new(__FILE__).dirname.join(name).read
  end
end
