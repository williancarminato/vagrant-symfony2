if [ ! -d /var/www/$1 ]; then
    cd /var/www/ && mkdir $1 && cd $1
    composer create-project symfony/framework-standard-edition . $2
fi