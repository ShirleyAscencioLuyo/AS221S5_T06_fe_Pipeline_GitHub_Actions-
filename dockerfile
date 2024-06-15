# Usar la imagen oficial de Node.js como la base
FROM node:18

# Crear el directorio de la aplicación
RUN mkdir -p /app

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos package.json y package-lock.json
COPY package*.json ./
  
# Instalar las dependencias del proyecto
RUN npm install

# Copiar todos los archivos del proyecto
COPY . .

# Construir la aplicación para producción
RUN npm run build --prod

# Exponer el puerto que la aplicación usará
EXPOSE 4200

# Definir el comando de inicio de la aplicación
CMD ["npm", "start"]