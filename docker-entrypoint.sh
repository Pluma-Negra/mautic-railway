#!/bin/bash
set -Eeuo pipefail

data=/data/mautic
app=/var/www/html
if ! mountpoint -q /data; then
    echo "Falta el volumen de Mautic en /data." >&2
    exit 1
fi
mkdir -p "$data"
# Mantener las carpetas originales de la imagen fuera de la raíz pública.
originals=/opt/mautic-image-defaults
mkdir -p "$originals"

connect_directory() {
    local src=$1 name=$2 dest="$data/$2" stage
    if [[ -L "$src" && "$(readlink "$src")" == "$dest" && -d "$dest" ]]; then
        return
    fi
    if [[ ! -d "$dest" ]]; then
        stage=$(mktemp -d "$data/.$name.XXXXXX")
        if [[ -d "$src" ]]; then
            cp -a "$src/." "$stage/"
        fi
        chown -R www-data:www-data "$stage"
        chmod 755 "$stage"
        mv -T "$stage" "$dest"
    fi
    chown www-data:www-data "$dest"
    if [[ -d "$src" && ! -L "$src" ]]; then
        mv -T "$src" "$originals/$name"
    fi
    mkdir -p "$(dirname "$src")"
    ln -sT "$dest" "$src"
}

connect_directory "$app/config" config
connect_directory "$app/docroot/media/files" files
connect_directory "$app/docroot/media/images" images
connect_directory "$app/var/logs" logs
exec /entrypoint.sh "$@"
