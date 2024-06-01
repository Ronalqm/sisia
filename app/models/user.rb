class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :validar_correo_docente

  private

  def validar_correo_docente
    unless Teacher.exists?(email: email)
      errors.add(:email, "no pertenece a un docente registrado")
    end
  end
end
