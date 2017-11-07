echo "Local dotfiles are:"
for d in $HOME/.*; do echo $d; done;
read -p "What should we save this as? " local

for d in $HOME/.*
do
	read -p "$d? " y
	if [ "$y" = "y" ]; then
		if [ ! -d "./$local" ]; then
			echo "mkdir -p $local/dotfiles"
			mkdir -p "$local/dotfiles"
			echo ""
		fi
		echo $d
		echo "$local/dotfiles"
		cp -r "$d" "$local/dotfiles/"$(basename $d)
	fi
done
