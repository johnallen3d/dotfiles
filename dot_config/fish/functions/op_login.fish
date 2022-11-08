function op_login
  op get account >/dev/null || eval (op signin pea_pod)
end
