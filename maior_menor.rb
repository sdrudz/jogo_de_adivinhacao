def da_boas_vindas
	puts "Olá, qual seu nome?"
	nome = gets
	puts "Bem vindo #{nome}"
	puts "\n"
end

def pede_dificuldade
	puts "Qual o nível de dificuldade que deseja? (1 fácil, 5 difícil) "
	dificuldade = gets.to_i
end


def sorteia_numero_secreto(dificuldade)
		case dificuldade
	 		 when 1
	 		 	maximo = 20
	 		 when 2
	 		 	maximo = 40
	 		 when 3 
	 		 	maximo = 80
	 		 when 4
	 		 	maximo = 120
	 		 else
	 		 	maximo = 200
		 end 

	puts "Escolha um número entre 0 e #{maximo}."
	sorteado = rand(maximo)
	puts
	puts "Escolhido... que tal adivinhar nosso número secreto ? "
	return sorteado
	puts "\n \n"
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
	puts "\n \n"
	puts "Tentativa #{tentativa} de #{limite_de_tentativas} ."
	puts "Seus chutes até agora: #{chutes}"
	puts "Digite o número..."
	chute = gets
	puts "Será que você acertou? Você digitou #{chute}"
	puts "\n"
	return chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)

	acertou = numero_secreto == chute

	if acertou
			puts "Acetou Miseravi!"
			return true
	end	
		maior = numero_secreto > chute
			if maior
				puts "O número secreto é maior..."	
			else
				puts "O número secreto é menor..."
			end
		return false	
end

da_boas_vindas
dificuldade = pede_dificuldade
numero_secreto = sorteia_numero_secreto dificuldade

pontos_ate_agora = 1000
limite_de_tentativas = 5
chutes = []

for tentativa in 1..limite_de_tentativas
		chute = pede_um_numero chutes, tentativa, limite_de_tentativas
		chutes << chute
		
		pontos_a_perder = (chute - numero_secreto).abs / 2.0
		pontos_ate_agora -= pontos_a_perder

		if verifica_se_acertou numero_secreto, chute
			break
		end
		
end

puts "Você ganhou #{pontos_ate_agora} pontos."

def joga(nome, dificuldade)
	numero_secreto = sorteia_numero_secreto dificuldade

	pontos_ate_agora = 1000
	limite_de_tentativas = 5
	chutes = []

	for tentativa in 1..limite_de_tentativas
			chute = pede_um_numero chutes, tentativa, limite_de_tentativas
			chutes << chute
			
			pontos_a_perder = (chute - numero_secreto).abs / 2.0
			pontos_ate_agora -= pontos_a_perder

			if verifica_se_acertou numero_secreto, chute
				break
			end
			
	end

	puts "Você ganhou #{pontos_ate_agora} pontos."

end

def nao_quero_jogar?
	puts "Quer jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do 
	if nao_quero_jogar?
			puts "Obrigado!"
		break	
	else
		joga nome, dificuldade	
	end
	
end
