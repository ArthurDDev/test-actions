FROM node:22.7.0
WORKDIR /usr/src/app
COPY . .
RUN apt install python3 make g++
RUN npm install --verbose
RUN npm audit fix
RUN npm install pm2 -g
ENV NUXT_HOST=0.0.0.0
EXPOSE 3000
CMD ["bash", "script.sh"]