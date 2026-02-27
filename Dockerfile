FROM nginx:alpine

# Metadonnees
LABEL maintainer="TP DevOps"
LABEL description="Application DevOps containerisee avec Nginx"

# Copier la configuration Nginx
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

# Copier les fichiers de l'application
COPY src/ /usr/share/nginx/html/

# Exposer le port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -q --spider http://localhost/ || exit 1

# Commande de demarrage
CMD ["nginx", "-g", "daemon off;"]
