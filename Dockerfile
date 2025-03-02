FROM node as builder

WORKDIR /workspace

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx

COPY --from=builder /workspace/build /usr/share/nginx/html
