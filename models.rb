class User
  
  def roles
   [:user]
  end

  def in_role?(role)
    roles.include?(role) 
  end

end
