# Игра в которой нужно придумать как можно больше слов которые
# подходят под регулярное выражение,игра проверяет слово на валидность
# и выводит результат игры
require './word_generator.rb'
require './checker.rb'
def clear#очистка экрана
	system ("clear")
end

def kirilitsa (methot,methoda,methodov,count)#возвращает склонение слова к числу
	#1 	  methot
	#2-4  methoda
	#0, (5-14) methodov
	

	if (count.to_i%100>=11&&count.to_i%100<=14)#Исключение когда 11-14
		return "#{count} #{methodov}" 
	end

	case count%10 #Последнее число
	when 0, 5..9
		return "#{count} #{methodov}"
	when 1
		return "#{count} #{methot}"
	when 2..4
		return "#{count} #{methoda}"

	else
		return
		nil
	end
	
end

def change_dot_to_star(word)
	word.gsub('.','*')
end

count = 0
checker1 = Checker.new 
clear
arrwords = []
puts "Добро пожаловать в игру!"

WG1 = WordGenerator.new
pattern = WG1.get_word


loop do
	puts "Придумайте как можно больше слов по шаблону.
Когда закончите, введите ключ \'x\' для выхода из игры"
puts"\n[#{change_dot_to_star(pattern)}]\n"
puts "\nЧисло угаданных слов = #{count}"

	word =STDIN.gets.chomp
	if (word=='х'||word =='x')
		break
	end
	clear
	if (word =~ /.*#{pattern}.*/)
		if (arrwords.include?(word))
			puts puts '|||Данное слово уже было введено ранее|||'
		else
			case checker1.is_exist?(word)
			when 0
				puts '|||Такого слова не существует|||'
			when 1
				puts '|||Такое слово существует|||'
				arrwords<<word
				count+=1
			when -1
				puts "Игра окончена вы угадали #{kirilitsa('слово','слова','слов',count)} "
				puts "\nУгаданные слова : #{arrwords.join(', ').to_s}"
				abort
			end

		end
		
	else 
		puts '|||Не соответствует правилам игры!|||'
	end
end

clear

puts "Игра окончена вы угадали #{kirilitsa('слово','слова','слов',count)} "
puts "\nУгаданные слова : #{arrwords.join(', ').to_s}"



