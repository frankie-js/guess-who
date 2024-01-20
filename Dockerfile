FROM node:20-alpine as builder

ARG VITE_CHARACTERS
ENV VITE_CHARACTERS=${VITE_CHARACTERS}

WORKDIR /guess-who

COPY ./package.json ./package-lock.json ./
RUN npm ci

COPY ./public ./public
COPY ./src ./src
COPY ./index.html ./tsconfig.json ./tsconfig.node.json ./vite.config.ts ./
RUN npm run build

# # ---

FROM nginx:1.25-alpine

WORKDIR /usr/share/nginx/html

COPY --from=builder /guess-who/dist ./
