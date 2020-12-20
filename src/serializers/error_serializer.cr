# This is the default error serializer generated by Lucky.
# Feel free to customize it in any way you like.
class ErrorSerializer < BaseSerializer
  def initialize(
    @message : String,
    @details : String? = nil,
    @param : String? = nil # so you can track which param (if any) caused the problem
  )
    super(:error, :errors)
  end

  def render
    {message: @message, param: @param, details: @details}
  end
end
