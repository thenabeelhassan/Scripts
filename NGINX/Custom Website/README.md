# Scripts

## NGINX

### Custom Website

1. Create a folder for website

```sh
sudo mkdir /web
```

2. Copy the website code file(s) in the folder
3. Create a new or update the default config in `/etc/nginx/sites-available/` with the content of `myweb`

4. (OPTIONAL) If creating new config, link the config from `/etc/nginx/sites-available/` to `/etc/nginx/sites-enabled/`

```sh
cd /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/myweb myweb
```

5. Restart the __NGINX__ service to apply the changes
```sh
sudo systemctl restart nginx
```

Note: As per the config in file `myweb` the website will be accessible on port `8443` to change it. update it's value on line 2.
