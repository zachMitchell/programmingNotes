# How to install a phpmyadmin setup on a debian-based linux system
Before writing this, I frantically web-searched everywhere, from official documentation,
to stackoverflow to figure out how to set up this system. As it turns out, Debian is an oddball in regards to setting up apache and php... and my phpadmin
[THE RESOURCES ARE ALL OVER THE PLACE!]
sooo, follow these steps, and be merry; it's probably easier than googling everywhere XP.

## first of all, INSTALL DE THANGZ:
1. php
1. mysql
1. phpmyadmin

*(apache is an install option while setting up phpmyadmin for the first time)*

## inside "/etc/apache2/apache2.conf":

insert the following into their respective locations:
### phpMyAdmin
`Include /etc/phpmyadmin/apache.conf`

### php
```
<FilesMatch \.php$>
    SetHandler application/x-httpd-php
</FilesMatch>
```
## install libapache2-mod-php7

(if not loaded) make a new file (whateverYouWant.load) in **/etc/apache2/mods-available**
insert into the file:
`LoadModule php7_module "/usr/lib/apache2/modules/libphp7.0.so"`


finally, enable it:
```sudo a2enmod```

if you need to disable it:
```sudo a2dismod```

# Random sources I googled:
http://www.ducea.com/2006/05/30/managing-apache2-modules-the-debian-way/

http://uk.php.net/manual/en/install.unix.apache2.php

https://www.liquidweb.com/kb/how-to-install-and-configure-phpmyadmin-on-ubuntu-14-04/

https://stackoverflow.com/questions/5484047/libphp5-so-missing

