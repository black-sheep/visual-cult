# coding: utf-8

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :second_name, :name, :phone, :login, :birthday, :city, :about, :what_inspires, :avatar
  # attr_accessible :title, :body

  has_many :galleries
  has_many :permissions, :through => :roles
  has_and_belongs_to_many :roles

  mount_uploader :avatar, AvatarUploader

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  phone_regex = /^[0-9\-\s]+$/
  name_regex = /^[a-zA-Zа-яА-Я\-]{2,40}$/


  validates :login, :presence => true,
            :length => {:maximum => 50},
            :uniqueness => { :case_sensitive => false }


  validates :email, :presence   => true,
            :format             => { :with => email_regex },
            :uniqueness         => true

  validates :password, :presence => true,
            :confirmation        => true,
            :length              => { :within => 6..40}

  validates :phone, :presence => true,
            :format           => { :with => phone_regex },
            :length           => { :within => 5..40},
            :uniqueness       => true

  validates :name, :presence => true,
            :format          => { :with => name_regex },
            :length          => { :within => 2..40}

  validates :second_name, :presence => true,
            :format                 => { :with => name_regex },
            :length                 => { :within => 2..40}

  before_create :add_default_role

  def can?(permission_name)
    self.permissions.find_by_name(permission_name)
  end

  private
  def add_default_role
    self.roles<<Role.find(3)
  end

end
