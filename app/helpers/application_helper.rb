module ApplicationHelper

  def button_class
    result = <<~CSS
      font-bold 
      rounded-md ring-2 ring-black ring-purple-700
      bg-purple-200 px-4 hover:bg-purple-500
    CSS
    result.squish
  end
end
