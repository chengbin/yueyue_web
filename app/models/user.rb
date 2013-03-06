#encoding: UTF-8
require 'digest/sha2'

class User < ActiveRecord::Base
  attr_accessible :name, :password_confirmation, :password
  attr_reader :password
  
  validates :name, :presence => {:message => "邮箱未输入"}, :uniqueness => {:message => "邮箱已被注册"}
  validates :password, :confirmation => {:message => "密码不一致"}
  validate :password_must_be_present
  validates :name, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/,
      :message => "邮件格式不正确" }

  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  private

  def password_must_be_present
    errors.add(:password, "请输入密码") unless hashed_password.present?
  end

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
