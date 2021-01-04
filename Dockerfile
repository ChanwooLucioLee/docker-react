# multi-stage build

FROM node:14-alpine

WORKDIR /app

COPY package.json .
RUN yarn install

COPY . .

RUN yarn build


FROM nginx:alpine

# 0: the built artifact from the previous stage
COPY --from=0 /app/build /usr/share/nginx/html