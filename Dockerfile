# Gunakan image resmi Python sebagai base image
FROM python:3.11

# Install MkDocs dan tema MkDocs Material
RUN apt-get update && apt-get install -y git && pip install mkdocs mkdocs-material mike mkdocs-git-revision-date-localized-plugin

# Set working directory di dalam kontainer
WORKDIR /docs

# Salin file konfigurasi MkDocs dan dokumentasi
COPY mkdocs.yml /docs/
COPY docs /docs/docs
COPY .git /docs/.git
COPY docs/versions.json /docs/versions.json

# Jalankan MkDocs server
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
