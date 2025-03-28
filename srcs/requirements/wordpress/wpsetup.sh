
sleep 25

CONFIG_FILE=wp-config.php
cd /var/www/wordpress
sleep 1
cp wp-config-sample.php wp-config.php

sed -i "s/votre_nom_de_bdd/$MY_DB/" "$CONFIG_FILE"
sed -i "s/votre_utilisateur_de_bdd/$MY_DB_USER/" "$CONFIG_FILE"
sed -i "s/votre_mdp_de_bdd/$MY_DB_PASS/" "$CONFIG_FILE"
sed -i "s/localhost/mariadb/" "$CONFIG_FILE"


wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core install --url="https://mbouayou.42.fr"\
                --title="Olala ela Website" \
                --admin_user="$WP_ADMIN_USER" \
                --admin_password="$WP_ADMIN_PASSWORD" \
                --admin_email="$WP_ADMIN_EMAIL" --allow-root


wp user create "$REGULAR_USER" "$REGULAR_EMAIL" --role=editor --user_pass="$REGULAR_PASSWORD" --allow-root

sleep 3
/usr/sbin/php-fpm8.2 -F