# 10.times do
#     ...
# end

# array.empty?

# string.capitalize -- primeira maiúscula

# constantes: VARIAVEL
# Obs: pode mudar o valor

# Nota pessoal: estados de steps + descrição automatica


# objeto "copiado" de um array para outro, na vdd, apenas copia referência. Uma alteração influencia a outra se for um objeto externo

# motivação testes, ex.: objeto salvo como string ou número, tratado como um tipo qualquer -> erro

# convenção: método que retorna apenas true ou false -> "?" no final do nome, ex.: objeto.includes?()
# se altera objeto -> bang !

# false - apenas nil ou false

# y também retorna e é o caso de uso mais comum - último expressão executada
# if ...
#     return x
# else
#     y
# end

# def metodo(param)
#     return false if param.nil?
# end

# def metodo(param)
#     return !param.nil?
# end

# object.is_a?(class)

# meta programação
# object.methods()

# object: self.val => escôpo público do objeto

# object.dup() or .clone() => duplica objeto

# ---- Herança ----

# Class.ancestors -< Object, Kernel, BasicObject

