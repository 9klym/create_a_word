#Класс проверщик слова
require 'net/http'
require 'addressable/uri'
class Checker
	
	#проверщик страницы в википедии
	def is_exist?(word,count_of_connection_times = 1)
		begin
			system "clear"
			url = "https://ru.wiktionary.org/wiki/#{word}"
			@page = Net::HTTP.get(
				URI.parse(Addressable::URI::escape(url))
				).force_encoding('UTF-8')
			if (@page =~ /В настоящий момент текст на данной странице отсутствует/)
				return 0
			end
			
		rescue SocketError
			if(count_of_connection_times==3)
				puts 'Вы исчерпали количество попыток!'
				return -1
			end
			puts 'Ошибка подключения к серверу'
			puts 'Попробовать подключиться еще раз?(да/нет)'
			choice = STDIN.gets.chomp.downcase
			while choice !='да'&&choice!='нет'
				puts 'введите да или нет!'
				puts 'Попробовать подключиться еще раз?(да/нет)'
				choice = STDIN.gets.chomp.downcase
			end
			case choice
			when 'да'
				count_of_connection_times+=1
				
				return is_exist?(word,count_of_connection_times)

			when 'нет'
				return -1
			end
			
		end

		return 1

	end
	
end



