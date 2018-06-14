echo "Local configs are:"
for local in ./*.local; do echo $local; done;
read -p "Which one do you want to load? " local

for file in $local/dotfiles/*
do
     ln -s $BASE_DIR/dotfiles/$local/$file $BASE_DIR/.$(basename $file);
done

