authorization do
  role :guest do
    has_permission_on :pages, :to => [ :index ]
    has_permission_on :new, :to => [ :index, :show ]
  end

  role :Admin do
    includes :guest
    has_permission_on :pages, :to => [ :admin ]
    has_permission_on :news,  :to => [ :new, :create, :edit, :update, :destroy ]
  end

  role :Customer do
    includes :guest
  end

  role :Photographer do
    includes :guest
  end
end