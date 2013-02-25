authorization do
  role :guest do
    has_permission_on :pages, :to => [ :index ]
  end

  role :Admin do
    includes :guest
    has_permission_on :pages, :to => [ :admin ]
  end

  role :Customer do
    includes :guest
  end
end