FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

RUN addgroup my_group && adduser dimon

COPY --chown=my_group:dimon --from=builder /app/build /usr/share/nginx/html