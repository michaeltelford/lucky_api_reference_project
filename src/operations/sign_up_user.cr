class SignUpUser < User::SaveOperation
  param_key :user

  # Change password validations in src/operations/mixins/password_validations.cr
  include PasswordValidations

  permit_columns email, max_cost

  attribute password : String
  attribute password_confirmation : String

  before_save do
    validate_uniqueness_of email
    Authentic.copy_and_encrypt password, to: encrypted_password
  end
end
