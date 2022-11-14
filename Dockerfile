FROM node:16 as build-stage
WORKDIR /app/
COPY . /app
RUN npm install
RUN npm run build


FROM nginx

COPY --from=build-stage /app/dist/ /usr/share/nginx/html