Dir.mkdir 'directorioNuevo'
F=File.new 'directorioNuevo/archivo.txt', 'a'
3.times do |p|
	Dir.mkdir "directorioNuevo/sub #{p+1}"
	5.times do |i|
		file = File.new "directorioNuevo/sub #{p+1}/archivo #{p}#{i+1}.txt", "a+"
		file.puts("File#{p}#{i}")
		F.puts(file.read)
		file.close

	end
end

Dir.chdir 'directorioNuevo'
folders = Dir.glob("*").reject {|e| e.include?('.txt') }

string =''

folders.each do |folder|

	Dir.chdir folder
	Dir.glob("*.txt").each do |file|
		f = File.open(file, 'r')
		string = string + " // " + f.read
		f.close 
	end
	Dir.chdir ".." 
end

File.open('archivo.txt', 'w').puts(string)