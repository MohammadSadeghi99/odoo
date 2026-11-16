FROM odoo:17

# switch to root to install
USER root

# system deps + python libs
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libpq-dev \
 && rm -rf /var/lib/apt/lists/*

# python requirements
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# your addons
COPY ./addons /mnt/extra-addons

# your config
COPY ./odoo.conf /etc/odoo/odoo.conf

USER odoo
