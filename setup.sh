for file in .*rc; do 
	touch "~/${file}";
	sudo cat $file > "~/${file}";
done
