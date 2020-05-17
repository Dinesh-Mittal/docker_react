FROM node:alpine as builder
workdir '/app'

copy package.json .
RUN npm install

copy . .

RUN npm run build


#2nd phase
FROM nginx
copy --from=builder /app/build /usr/share/nginx/html