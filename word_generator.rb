#Класс генератор слова для паттерна поиска с пропущенным символом
class WordGenerator
	#Конструктор
	def initialize
		@current_path = File.dirname(__FILE__)
		@file_path = '/data/root.txt'
		@full_path = @current_path+@file_path

		@final_word = creator(@full_path)
	end

	#метод читает источник и получает слово из него
	def rand_word(full_path)

		begin#если файл с источник существует
			
			stream = File.new(full_path) #открываем подключением
			arr = stream.readlines # читаем содержимое построчно
			stream.close#закрываем подключение

		rescue#если файл с источник не существует
			abort "Файл #{full_path} не найден!"
		end

		word = arr.sample#выбирает случайный эллемент массива слов


		return word.delete("\n")#отрезает переходы строк,ессли такие сужествуют
	end

	#метод получает на вход слово и замещает произвольный символ на точку
	def creator(full_path)
		word = rand_word(full_path)#спауним слово

		letter = word.split('').sample #разбивает слово формата String на Array посимвольно
		
		return word.gsub(letter,'.') #замещает один символ на точку
	end

	def get_word#Геттер
		@final_word
	end

end
